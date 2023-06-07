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
  Future<Earthquake?>? _earthquakeFuture =
      null; // Future nesnesini tanımladık ve başlangıçta null olarak ayarladık

  @override
  void initState() {
    super.initState();
    _fetchEarthquakeData(); // Veriyi getiren yöntemi çağırdık
  }

  Future<void> _fetchEarthquakeData() async {
    final future = _client.getLastEarthquake(); // Future nesnesini başlatıyoruz
    setState(() {
      _earthquakeFuture = future; // Future nesnesini güncelliyoruz
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Earthquake?>(
          future: _earthquakeFuture, // Future nesnesini kullanıyoruz
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Earthquake? earthquake = snapshot.data;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(image: NetworkImage(earthquake!.mapImage!)),
                  const SizedBox(height: 8.0),
                  Text(
                    'Büyüklük: ${earthquake.depth} ve Derinlik: ${earthquake.depth}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    earthquake.region.toString(),
                    style: const TextStyle(fontSize: 16.0),
                  ),
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
