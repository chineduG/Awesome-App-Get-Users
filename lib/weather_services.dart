import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model_services.dart';

class WeatherService {
  // ignore: missing_return
  Future<WeatherResponse> getWeather(String city) async {
    // 'api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}';
    final queryApp = {
      'q': city,
      'appid': 'e245d9f19e7b5d6306e31ecfb637ba2a',
      'units': 'imperial'
    };

    final url =
        Uri.https('api.openweathermap.org', '/data/2.5/weather', queryApp);
    final response = await http.get(url);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
