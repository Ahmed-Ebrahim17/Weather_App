import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/components/page_route.dart';
import 'package:weather/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather/cubits/weather_cubit/weather_state.dart';

import '../models/weather_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CreateRoute(),
                );
              },
              icon: const Icon(Icons.search)),
        ],
        title: const Text("Flutter Weather"),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.black,
              ),
            );
          } else if (state is WeatherSuccess) {
            return SuccessBody(
              weatherData: state.weatherModel,
            );
          } else if (state is WeatherFailure) {
            return const Center(
              child: Text('Something went wrong please try again'),
            );
          } else {
            return const DefaultBody();
          }
        },
      ),
    );
  }
}

class SuccessBody extends StatelessWidget {
  SuccessBody({
    required this.weatherData,
    super.key,
  });
  WeatherModel weatherData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherData.getThemeColor(),
            weatherData.getThemeColor()[300]!,
            weatherData.getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            'Updated at : ${weatherData.date.hour}:${weatherData.date.minute} ',
            style: const TextStyle(
              fontSize: 19,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData.getImage()),
              const Text(
                '',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text('Max: ${weatherData.minTemp.toInt()}'),
                  Text('Min: ${weatherData.minTemp.toInt()}'),
                ],
              ),
            ],
          ),
          const Spacer(flex: 1),
          Text(
            ' ${weatherData.weatherStatus}',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
          const Spacer(
            flex: 6,
          ),
        ],
      ),
    );
  }
}

class DefaultBody extends StatelessWidget {
  const DefaultBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
          mainAxisSize:
              MainAxisSize.min, // كدا ال كولم واخد الهايت بتاع الشلدرين .
          children: [
            Text(
              "Please select a location ",
              style: TextStyle(fontFamily: 'GrandifloraOne', fontSize: 18),
            ),
          ]),
    );
  }
}
