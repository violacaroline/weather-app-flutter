import 'package:flutter/material.dart';
import 'package:weather_app/widgets/pop_up_menu.dart';

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
        size: 40,
        color: Colors.white,
        )
      ),
      actions: const [
        PopUpMenu(),
      ],
    );
  }
}
