import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:light_dark/components/circular_menu_drawer.dart';
import 'package:light_dark/pages/about_page.dart';
import 'package:light_dark/pages/home_page.dart';
import 'package:light_dark/pages/posts_page.dart';
import 'package:light_dark/pages/settings_page.dart';
import 'package:light_dark/pages/users_page.dart';
import 'package:light_dark/theme/theme.dart';
import 'package:light_dark/theme/theme_bloc.dart';
import 'package:light_dark/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that Flutter is initialized
  await Hive.initFlutter();
  await Hive.openBox('userBox'); // Open the box

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeBloc = ThemeBloc();

  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext mainContext) {
    List<Widget> pages = [
      MyHomePage(themeBloc: themeBloc),
      UserPage(themeBloc: themeBloc),
      PostPage(themeBloc: themeBloc),
      SettingsPage(themeBloc: themeBloc),
      AboutPage(themeBloc: themeBloc),
    ];

    handleMenuSelection(int index) {
      setState(() {
        _selectedPageIndex = index;
      });
    }

    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).getTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.light, // or ThemeMode.dark
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          pages[_selectedPageIndex],
          CircularMenuWidget(
            handleMenuSelection: handleMenuSelection,
          ),
        ],
      ),
    );
  }
}
