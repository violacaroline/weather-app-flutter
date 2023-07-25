import 'package:flutter/material.dart';
import 'package:weather_app/widgets/pop_up_menu.dart';
import 'package:go_router/go_router.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget  {
  const WeatherAppBar ({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          GoRouter.of(context).go('/');
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
