import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/pages/about_page.dart';
import 'package:weather_app/pages/forecast_page.dart';
import 'pages/weather_page.dart';


void main() {
  final goRouter = GoRouter(routes: [
    GoRoute(path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: WeatherPage(title: 'A Flutter Weather App'));
    }),
    GoRoute(path: '/about',
      pageBuilder: (context, state) {
      return const MaterialPage(child: AboutPage());
    }),
    GoRoute(path: '/forecast',
      pageBuilder: (context, state) {
        return const MaterialPage(child: ForecastPage());
      })
  ]);

  runApp(WeatherApp(goRouter: goRouter));
}

class WeatherApp extends StatelessWidget {
  final GoRouter goRouter;

  const WeatherApp({super.key, required this.goRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
    );
  }
}


