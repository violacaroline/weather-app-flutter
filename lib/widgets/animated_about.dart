import 'package:flutter/material.dart';

class AnimatedAbout extends StatelessWidget {
  final String appAboutTitle;
  final String appAboutInfo;

  const AnimatedAbout({super.key, required this.appAboutTitle, required this.appAboutInfo});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(appAboutTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 30,),
          Text(appAboutInfo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
