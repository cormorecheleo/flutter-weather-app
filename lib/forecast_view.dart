import 'package:flutter/material.dart';

class ForecastView extends StatelessWidget {
var WeatherApiResponse ? apiResponse;

  // CTOR
  const ForecastView({required this.apiResponse});

@override
Widget build(BuildContext context){
  return (apiResponse == null) ? Center(
    child: Text("Pas de données", style: TextStyle(fontSize: 24))
  ),
  )
}

}