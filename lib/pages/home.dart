import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     const String mapBoxAccessToken =  'pk.eyJ1IjoibW9oYW5uYWQ0IiwiYSI6ImNrd2tpbHA3bjBqcDIydnBkODhmamNycWgifQ.1BzZ74jt-GXkcIDfhYA4PA';
     const String mapBoxStyleId = 'mapbox://styles/mohannad4/cle1qhvsv002601oggvmthc5p';
     final myLocation = LatLng(31.52939433711108, 34.45657726997659);

     //mapBox app 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 32, 32),
        title: const Text('Flutter MapBox'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 3,
              maxZoom: 18,
              zoom: 13,
              center: myLocation,

            ),
            nonRotatedChildren: [
              TileLayer(
                urlTemplate:
               'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                additionalOptions: const {
                  'mapStyleId': mapBoxStyleId,
                  'accessToken': mapBoxAccessToken,
                  'id': 'mapbox/streets-v11',
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

