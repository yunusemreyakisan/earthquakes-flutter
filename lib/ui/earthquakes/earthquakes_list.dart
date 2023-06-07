import 'package:flutter/material.dart';

class EarthquakesList extends StatefulWidget {
  const EarthquakesList({super.key});

  @override
  State<EarthquakesList> createState() => _EarthquakesListState();
}

class _EarthquakesListState extends State<EarthquakesList> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Earthquakes List"),
    );
  }
}
