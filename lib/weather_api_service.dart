import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather/api_key_service.dart';
import 'package:weather/geo_position.dart';


class WeatherApiService {
  final baseUrl="https://api.openweathermap.org/data/2.5/forecast";
  final lat = "lat=";
  final lon = "lon=";
  final appid = "appid=";
  final lang = "lang=fr";
  final units = "units=metric";
 
 String prepareQuery(GeoPosition geoPosition) {
  final userLat = geoPosition.lat;
  final userLon = geoPosition.lon;
  final query = "$baseUrl?$lat$userLat&$lon$userLon&$units&$lang&$appid$apiKey";
  debugPrint("http query = $query");
  return query;
 }

 Future<void> callWeatherApi(GeoPosition position) async {
  final query = prepareQuery(position);
  final uri = Uri.parse(query);
  final call = await get(uri);

  // le 'dynamic' permet d'avoir un polymorphisme de type
  Map<String, dynamic> jsonResponse = json.decode(call.body);
  
  debugPrint(jsonResponse.toString());
 }

}