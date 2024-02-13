import 'package:flutter/material.dart';
import 'package:light_dark/theme/theme_bloc.dart';
import 'package:light_dark/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  final ThemeBloc themeBloc;
  const PostPage({super.key, required this.themeBloc});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Posts',
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
              Text('Posts Page', style: Theme.of(context).textTheme.bodyLarge),
        ),
      ),
    );
  }
}
