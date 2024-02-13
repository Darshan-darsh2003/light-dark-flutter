import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularMenuWidget extends StatefulWidget {
  final Function handleMenuSelection;
  const CircularMenuWidget({super.key, required this.handleMenuSelection});

  @override
  State<CircularMenuWidget> createState() => _CircularMenuWidgetState();
}

class _CircularMenuWidgetState extends State<CircularMenuWidget> {
  GlobalKey<CircularMenuState> menu_key = GlobalKey<CircularMenuState>();

  List links = [
    {'icon': Icons.home},
    {'icon': Icons.person},
    {'icon': Icons.image},
    {'icon': Icons.settings},
    {'icon': Icons.info},
  ];

  @override
  Widget build(BuildContext context) {
    return CircularMenu(
      toggleButtonColor: Theme.of(context).colorScheme.primary,
      toggleButtonIconColor: Theme.of(context).colorScheme.onPrimary,
      radius: 120,
      toggleButtonBoxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          spreadRadius: 3,
          offset: const Offset(0, 0),
        ),
      ],
      alignment: Alignment.bottomCenter,
      startingAngleInRadian: 1.05 * math.pi,
      endingAngleInRadian: 1.95 * math.pi,
      backgroundWidget: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ),
      key: menu_key,
      items: links
          .map((e) => CircularMenuItem(
                color: Theme.of(context).colorScheme.primary,
                icon: e['icon'],
                onTap: () {
                  setState(() {
                    widget.handleMenuSelection(links.indexOf(e));
                    menu_key.currentState?.reverseAnimation();
                  });
                },
                iconColor: Theme.of(context).colorScheme.onPrimary,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ))
          .toList(),
    );
  }
}
