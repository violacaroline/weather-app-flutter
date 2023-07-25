import 'package:flutter/material.dart';
import 'package:weather_app/widgets/pop_up_menu.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget  {
  final VoidCallback refresh;

  const WeatherAppBar ({super.key, required this.refresh});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          refresh();
        },
        icon: const Icon(Icons.refresh,
          size: 35,
        ),
      ),
      actions: const [
        PopUpMenu(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
