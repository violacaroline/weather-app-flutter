import 'package:flutter/material.dart';
import 'package:weather_app/widgets/animated_about.dart';
import 'package:weather_app/widgets/app_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: const AnimatedAbout()
        ),
      ),
    );
  }
}
