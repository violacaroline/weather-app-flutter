import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({super.key});

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
      child: PopupMenuButton<String>(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onSelected: (value) {
            GoRouter.of(context).go(value);
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem<String>(
              value: '/',
              child: Text('Current Weather'),
            ),
            const PopupMenuItem<String>(
              value: '/forecast',
              child: Text('Forecast'),
            ),
            const PopupMenuItem<String>(
              value: '/about',
              child: Text('About'),
            ),
          ],
          child: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 40,
          )),
    );
  }
}
