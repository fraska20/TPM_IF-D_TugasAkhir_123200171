import 'package:flutter/material.dart';
import 'package:flutter_weather/screens/navigasi.dart';
import 'package:flutter_weather/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingPageState();
  }
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    print(weatherData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Navigasi(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.white,
          size: 25.0,
        ),
      ),
    );
  }
}
