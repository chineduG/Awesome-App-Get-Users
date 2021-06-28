import 'package:flutter/material.dart';
import 'package:weather_app/model_services.dart';
import 'package:weather_app/weather_services.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  TextEditingController _cityController = TextEditingController();
  final dataServices = WeatherService();

  WeatherResponse _response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.stream),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_response != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        '${_response.cityName.toUpperCase()}',
                        style: TextStyle(fontSize: 40),
                      ),
                      Image.network(_response.iconUrl),
                      Text(
                        '${_response.tempInfo.temperature}',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(
                        '${_response.weatherInfo.description}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      labelText: 'City'.toUpperCase(),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(onPressed: _search, child: Text('Search'))
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    final response = await dataServices.getWeather(_cityController.text);
    setState(() => _response = response);
  }
}

