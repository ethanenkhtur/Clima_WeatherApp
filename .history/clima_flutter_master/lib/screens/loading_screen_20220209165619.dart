import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';
import 'package:clima_flutter_master/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getPositionData();
  }

  void getPositionData() {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = weatherModel.getLocationWeather();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => LocationScreen(
            locationData: weatherData,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          size: 100.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
