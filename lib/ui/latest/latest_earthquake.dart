import 'package:earthquakes/components/background/map_image.dart';
import 'package:earthquakes/components/card/latest_earthquake_card.dart';
import 'package:earthquakes/data/model/earthquake_model.dart';
import 'package:flutter/material.dart';

import '../../data/remote/api/dio/dio_client.dart';

class LatestEarthquake extends StatefulWidget {
  const LatestEarthquake({Key? key}) : super(key: key);

  @override
  _LatestEarthquakeState createState() => _LatestEarthquakeState();
}

class _LatestEarthquakeState extends State<LatestEarthquake> {
  final DioClient _client = DioClient();
  Future<Earthquake?>? _earthquakeFuture = null;

  @override
  void initState() {
    super.initState();
    _fetchEarthquakeData();
  }

  //Get Data
  Future<void> _fetchEarthquakeData() async {
    final future = _client.getLastEarthquake();
    setState(() {
      _earthquakeFuture = future;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Earthquake?>(
          future: _earthquakeFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Earthquake? earthquake = snapshot.data;
              return Stack(
                children: [
                  CustomMapImage(mapImage: NetworkImage(earthquake!.mapImage!)),
                  LatestEarthquakeCard(
                    earthquakeDepth: earthquake.depth.toString(),
                    earthquakeLoc: earthquake!.region.toString(),
                    earthquakePower: earthquake.magnitude.toString(),
                    earthquakeDate: earthquake.lastUpdate.toString(),
                    earthquakeTime: earthquake.time.toString(),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            return const CircularProgressIndicator(
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}

/*
const SizedBox(height: 8.0),
                  Text(
                    'Büyüklük: ${earthquake.depth} ve Derinlik: ${earthquake.depth}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    earthquake.region.toString(),
                    style: const TextStyle(fontSize: 16.0),
                  ),
*/
