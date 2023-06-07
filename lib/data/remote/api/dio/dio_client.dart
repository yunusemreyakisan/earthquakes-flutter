import 'package:dio/dio.dart';
import 'package:earthquakes/data/remote/api/constant/api_constants.dart';

import '../../../model/earthquake_model.dart';

class DioClient {
  final Dio _dio = Dio();

  // Get Last Earthquake Datum
  Future<Earthquake?> getLastEarthquake() async {
    Earthquake? earthquake;
    try {
      Response<dynamic> response = await _dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.lastEarthquakePoint}',
      );

      // Check if the response contains a valid data structure
      if (response.data is List<dynamic>) {
        final List<dynamic> earthquakeDataList = response.data;
        print("Latest Earthquake: ${response.data}");
        if (earthquakeDataList.isNotEmpty) {
          final Map<String, dynamic> earthquakeData = earthquakeDataList[0];
          earthquake = Earthquake.fromJson(earthquakeData);
        }
      } else if (response.data is Map<String, dynamic>) {
        final Map<String, dynamic> earthquakeData = response.data;
        earthquake = Earthquake.fromJson(earthquakeData);
      } else {
        throw Exception('Invalid data structure in the response');
      }
    } on DioError catch (e) {
      // Handle Dio errors
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return earthquake;
  }
}
