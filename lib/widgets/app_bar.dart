import 'package:flutter/material.dart';

class WeatherAppBar extends StatefulWidget implements PreferredSizeWidget  {
  const WeatherAppBar ({super.key});

  @override
  State<WeatherAppBar> createState() => _WeatherAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _WeatherAppBarState extends State<WeatherAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
      onPressed: () {},
        icon: const Icon(
        Icons.search,
        size: 30,
        color: Colors.white,
        )
      ),
      actions: [
        Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: GestureDetector(
          onTap: () => print('Menu clicked'),
            child: const Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
