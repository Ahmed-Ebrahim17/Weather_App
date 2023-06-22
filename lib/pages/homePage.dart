import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/search_screen.dart';
import 'package:weather/providers/weather_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void UpdateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage(
                    UpdateUI: UpdateUi,
                  );
                }));
              },
              icon: const Icon(Icons.search)),
        ],
        title: const Text("Flutter Weather"),
      ),
      body: weatherData == null
          ? const Center(
              child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // كدا ال كولم واخد الهايت بتاع الشلدرين .
                  children: [
                    Text(
                      "Please select a location ",
                      style:
                          TextStyle(fontFamily: 'GrandifloraOne', fontSize: 18),
                    ),
                  ]),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[300]!,
                  weatherData!.getThemeColor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
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
                      Image.asset(weatherData!.getImage()),
                      Text(
                        '${weatherData!.temp.toInt()}',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text('Max_Temp: ${weatherData!.maxtemp.toInt()}'),
                          Text('Min_Temp: ${weatherData!.mintemp.toInt()}'),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(flex: 1),
                  Text(
                    weatherData!.weatherStatus,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  const Spacer(
                    flex: 6,
                  ),
                ],
              ),
            ),
    );
  }
}
