import 'package:clima_flutter_master/screens/city_screen.dart';
import 'package:clima_flutter_master/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter_master/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final dynamic locationData;

  const LocationScreen({Key? key, this.locationData}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  var temperature = 10;
  var cityName = '';
  var cityNameText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationData);
  }

  void updateUI(Future<dynamic> weatherDataFuture) async {
    final dynamic weatherData = await weatherDataFuture;
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        cityName = '';
        cityNameText = 'Unable to get weather data';
        return;
      } else {
        double temp = weatherData['main']['temp'];
        temperature = temp.round();
        cityName = weatherData['name'];
        cityNameText = weather.getMessage(temperature);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      dynamic weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      String typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const CityScreen();
                        }),
                      );
                      var cityWeatherData =
                          await weather.getCityWeather(typedName);
                      updateUI(cityWeatherData);
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: const TextStyle(
                        fontFamily: 'Spartan MB',
                        fontSize: 130,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "$cityNameText in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
