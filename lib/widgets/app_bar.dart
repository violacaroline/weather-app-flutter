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
        size: 40,
        color: Colors.white,
        )
      ),
      actions: [
        Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: PopupMenuButton<String>(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onSelected: (value) {
            // Handle the menu item selection
            print('Selected: $value');
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
              value: 'item1',
                child: Text('Forecast'),
              ),
              const PopupMenuItem<String>(
              value: 'item2',
                child: Text('About'),
              ),
              const PopupMenuItem<String>(
              value: 'item3',
                child: Text('Something'),
              ),
          ],
            child: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 40,
            )),
        )
      ],
    );
  }
}
