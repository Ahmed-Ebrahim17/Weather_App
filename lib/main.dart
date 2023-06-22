import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/providers/weather_provider.dart';

import 'pages/homePage.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch:
              Provider.of<WeatherProvider>(context).weatherData == null
                  ? Colors.blue
                  : Provider.of<WeatherProvider>(context)
                      .weatherData!
                      .getThemeColor()),
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}
