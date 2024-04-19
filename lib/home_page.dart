import 'package:flutter/material.dart';
import 'package:weather/api_key_service.dart';
import 'package:location/location.dart';
import 'package:weather/location_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  LocationData? locationData;

  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Weather Api Demo"),
      ),
      body: Center(
        child: Text("Latitude=${locationData?.latitude}\nLongitude=${locationData?.longitude}",
        style: const TextStyle(fontSize: 32))
      ),
    );
  }

  getUserLocation() async {
    final currenLocation = await LocationService().getPosition();
    setState(() {
      locationData = currenLocation;
    });
  }
}
