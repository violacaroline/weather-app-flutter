import 'package:flutter/material.dart';
import 'package:weather_app/widgets/animated_about.dart';
import 'package:weather_app/widgets/app_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String appAboutTitle = 'The Weather App Project';
    const String developerInfo = 'This Flutter App is developed by Andrea Viola Caroline Åkesson'
        ' for the course 1DV535 @ Linnaeus University, Sweden';
    
    return Scaffold(
      appBar: const GeneralAppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: const AnimatedAbout(appAboutTitle: appAboutTitle, appAboutInfo: developerInfo,)
        ),
      ),
    );
  }
}
