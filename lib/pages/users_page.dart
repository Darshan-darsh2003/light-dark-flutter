import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:light_dark/components/database/database.dart';
import 'package:light_dark/theme/theme_bloc.dart';
import 'package:light_dark/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  final ThemeBloc themeBloc;
  const UserPage({super.key, required this.themeBloc});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _users = Hive.box('userBox');
  UserDatabase db = UserDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Users',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: Icon(
                Theme.of(context).brightness == Brightness.dark
                    ? Icons.wb_sunny
                    : Icons.nights_stay,
              ),
              onPressed: () {
                final themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);
                themeProvider.toggleTheme();
              },
            ),
          ),
        ],
        iconTheme: IconThemeData(
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
      body: Container(
        child: Center(
          child:
              Text('Users Page', style: Theme.of(context).textTheme.bodyLarge),
        ),
      ),
    );
  }

  Widget _buildUserList() {
    print(_users.length);
    print(_users);
    return ListView.builder(
      itemCount: _users.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(_users.getAt(index).name),
          subtitle: Text(_users.getAt(index).email),
        );
      },
    );
  }
}
