// اmodel  عباره عن اوبجكت جاي م النت انا اللي هعمله .

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxtemp;
  double minTemp;
  String weatherStatus;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxtemp,
      required this.minTemp,
      required this.weatherStatus});
// The purpose from this constructor is to build an object from the internet data(json)

// factory makes the constructor to return an object from the same type of classmodel u defined it.
// A factory constructor is used to return an instance of a class from a different source or with different parameters than the regular constructors.
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0];
    String dateStart = data['location']['localtime'];
    DateFormat inputFormat = DateFormat('dd-MM-yyyy hh:mm');
    DateTime input = inputFormat.parse(dateStart);
    // String datee = DateFormat('hh:mm a').format(input);

    return WeatherModel(
      date: input,
      temp: jsonData['day']['avgtemp_c'],
      maxtemp: jsonData['day']['maxtemp_c'],
      minTemp: jsonData['day']['mintemp_c'],
      weatherStatus: jsonData['day']['condition']['text'],
    );
  }

  String getImage() {
    if (weatherStatus == 'Sunny' ||
        weatherStatus == 'Clear' ||
        weatherStatus == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (weatherStatus == 'Blizzard' ||
        weatherStatus == 'Patchy snow possible' ||
        weatherStatus == 'Patchy sleet possible' ||
        weatherStatus == 'Patchy freezing drizzle possible' ||
        weatherStatus == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherStatus == 'Freezing fog' ||
        weatherStatus == 'Fog' ||
        weatherStatus == 'Heavy Cloud' ||
        weatherStatus == 'Mist' ||
        weatherStatus == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherStatus == 'Patchy rain possible' ||
        weatherStatus == 'Heavy Rain' ||
        weatherStatus == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherStatus == 'Thundery outbreaks possible' ||
        weatherStatus == 'Moderate or heavy snow with thunder' ||
        weatherStatus == 'Patchy light snow with thunder' ||
        weatherStatus == 'Moderate or heavy rain with thunder' ||
        weatherStatus == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/Sunny.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStatus == 'Sunny' ||
        weatherStatus == 'Clear' ||
        weatherStatus == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherStatus == 'Blizzard' ||
        weatherStatus == 'Patchy snow possible' ||
        weatherStatus == 'Patchy sleet possible' ||
        weatherStatus == 'Patchy freezing drizzle possible' ||
        weatherStatus == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStatus == 'Freezing fog' ||
        weatherStatus == 'Fog' ||
        weatherStatus == 'Heavy Cloud' ||
        weatherStatus == 'Mist' ||
        weatherStatus == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStatus == 'Patchy rain possible' ||
        weatherStatus == 'Heavy Rain' ||
        weatherStatus == 'Showers	') {
      return Colors.blue;
    } else if (weatherStatus == 'Thundery outbreaks possible' ||
        weatherStatus == 'Moderate or heavy snow with thunder' ||
        weatherStatus == 'Patchy light snow with thunder' ||
        weatherStatus == 'Moderate or heavy rain with thunder' ||
        weatherStatus == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
