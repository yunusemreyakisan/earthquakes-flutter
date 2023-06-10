import 'package:earthquakes/components/item/earthquake_list_item.dart';
import 'package:flutter/material.dart';

import '../../data/model/earthquake_model.dart';
import '../../data/remote/api/dio/dio_client.dart';

class EarthquakesList extends StatefulWidget {
  const EarthquakesList({super.key});

  @override
  State<EarthquakesList> createState() => _EarthquakesListState();
}

class _EarthquakesListState extends State<EarthquakesList> {
  final DioClient _client = DioClient();
  List<Earthquake> earthquakes = [];

  @override
  void initState() {
    super.initState();
    _getEarthquakes();
    print("Liste: $earthquakes");
  }

  //Get Data
  Future<List<Earthquake>> _getEarthquakes() async {
    List<Earthquake> fetchedEarthquakes = await _client.getAllEarthquakes();
    setState(() {
      earthquakes = fetchedEarthquakes;
    });
    return earthquakes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Earthquake>>(
        future: _getEarthquakes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<Earthquake> earthquakes = snapshot.data ?? [];
            if (earthquakes.isEmpty) {
              return const Center(
                child: Text('No data available.'),
              );
            } else {
              return ListView.builder(
                itemCount: earthquakes.length,
                itemBuilder: (context, index) {
                  Earthquake earthquake = earthquakes[index];
                  return EarthquakeListItem(
                    earthquakeMapImageUrl: earthquake.mapImage!,
                    earthquakeMagnitude: earthquake.magnitude!.toDouble(),
                    earthquakeRegion: earthquake.region!,
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}