import 'package:earthquakes/ui/earthquakes/earthquakes_list.dart';
import 'package:earthquakes/ui/latest/latest_earthquake.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  var _currentIndex = 0; //Current index
  final List<Widget> _children = const [
    LatestEarthquake(),
    EarthquakesList()
  ]; //Screen list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Latest Earthquake
          SalomonBottomBarItem(
            icon: const Icon(Icons.public),
            title: const Text("Son Deprem"),
            selectedColor: Colors.red,
          ),

          /// Earthquakes List
          SalomonBottomBarItem(
            icon: const Icon(Icons.sort),
            title: const Text("Son Depremler"),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
