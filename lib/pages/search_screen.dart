import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_cubit/weather_cubit.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  String? cityName;

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

                BlocProvider.of<WeatherCubit>(context)
                    .getWeather(cityName: cityName!);
                BlocProvider.of<WeatherCubit>(context).cityName = cityName;
                Navigator.of(context).pop();
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
                BlocProvider.of<WeatherCubit>(context)
                    .getWeather(cityName: cityName!);
                BlocProvider.of<WeatherCubit>(context).cityName = cityName;
                Navigator.of(context).pop();
              },
              child: const Text("Search")),
        ]),
      ),
    );
  }
}
