import 'package:earthquakes/components/item/earthquake_list_item.dart';
import 'package:flutter/material.dart';

import '../../data/model/earthquake_model.dart';
import '../../data/remote/api/dio/dio_client.dart';

class EarthquakesList extends StatefulWidget {
  const EarthquakesList({Key? key}) : super(key: key);

  @override
  State<EarthquakesList> createState() => _EarthquakesListState();
}

class _EarthquakesListState extends State<EarthquakesList> {
  final DioClient _client = DioClient();
  List<Earthquake> earthquakeList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getEarthquakeData();
  }

  // Get Earthquake Data
  Future<void> _getEarthquakeData() async {
    try {
      List<Earthquake> earthquakes = await _client.getAllEarthquakes();
      setState(() {
        earthquakeList = earthquakes;
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : RefreshIndicator(
          onRefresh: _getEarthquakeData,
          child: ListView.builder(
            itemCount: earthquakeList.length,
            itemBuilder: (context, index) {
              Earthquake earthquake = earthquakeList[index];
              return EarthquakeListItem(
                earthquakeMapImageUrl: earthquake.mapImage!,
                earthquakeMagnitude: earthquake.magnitude!.toDouble(),
                earthquakeRegion: earthquake.region!,
              );
            },
          ),
        ),
      ),
    );
  }
}
