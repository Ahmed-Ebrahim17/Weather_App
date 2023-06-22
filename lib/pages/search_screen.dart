import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/services/weather_services.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({super.key, this.UpdateUI});
  String? cityName;
  VoidCallback? UpdateUI;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
      ),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 19),
            child: TextField(
              onChanged: (data) {
                cityName = data;
              },
              onSubmitted: (data) async {
                cityName = data;
                WeatherService service = WeatherService();
                WeatherModel? Weather =
                    await service.getWeather(cityName: cityName!);

                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = Weather;
                Provider.of<WeatherProvider>(context, listen: false).cityName =
                    cityName;

                Navigator.pop(context);
              },
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 18),
                // border: const OutlineInputBorder(),
                hintText: "Enter a city",
                // suffixIcon: const Icon(Icons.search)
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          ElevatedButton(
              onPressed: () async {
                WeatherService service = WeatherService();
                WeatherModel? Weather =
                    await service.getWeather(cityName: cityName!);

                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = Weather;
                Provider.of<WeatherProvider>(context, listen: false).cityName =
                    cityName;

                Navigator.pop(context);
              },
              child: const Text("Search")),
        ]),
      ),
    );
  }
}
