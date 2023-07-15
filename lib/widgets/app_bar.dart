import 'package:flutter/material.dart';
import 'package:weather_app/widgets/pop_up_menu.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GeneralAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[900],
      actions: const [
        PopUpMenu(),
      ],
    );
  }
}
