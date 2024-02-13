import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Brightness brightness;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onTap,
    required this.brightness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyText1?.color,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(
              brightness == Brightness.dark
                  ? Icons.wb_sunny
                  : Icons.nights_stay,
            ),
            onPressed: onTap,
          ),
        ),
      ],
      iconTheme: IconThemeData(
        color: Theme.of(context).textTheme.bodyText1?.color,
      ),
    );
  }
}