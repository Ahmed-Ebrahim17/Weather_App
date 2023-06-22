// Call Api.

// http is a keyword to access the contents of the import link.
//   عادي احط اي متغير عشان العمل اكسيز لل الحاجات اللي في الفايل دا
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '643b38a49f684131b1f173020231706';
  WeatherModel? weather;

  Future<WeatherModel?> getWeather({required String cityName}) async {
    try {
      Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName');
      // parse بتحول اللينك ل url object.
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);
      // اmodel  عباره عن اوبجكت جاي م النت انا اللي هعمله .

      weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
