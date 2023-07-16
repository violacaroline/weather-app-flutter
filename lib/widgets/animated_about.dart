import 'package:flutter/material.dart';

class AnimatedAbout extends StatelessWidget {
  const AnimatedAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 2),
      builder: (BuildContext context, double val, Widget? child) {
        return Opacity(
          opacity: val,
          child: child,
        );
    },
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('The Weather App Project',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 30,),
          Text('This Flutter App is developed by Andrea Viola Caroline Åkesson'
              ' according to specifics by Linnaeus University, Sweden',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
