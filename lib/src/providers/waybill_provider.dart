import 'package:dio/dio.dart';
import 'package:erantech/src/models/waybill_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final waybillProvider  = FutureProvider<List<WaybillEntity>>((ref) async {
  // Replace 'your_api_endpoint' with the actual URL of your API
  const String apiUrl = 'http://192.168.1.12:8081/api/v1/goal/waybill?startDate=2024-01-01&endDate=2024-03-31';

  try {
    // Create Dio instance
    final dio = Dio();
    // Make HTTP GET request
    final response = await dio.get(apiUrl);

    // Check if the response is successful
    if (response.statusCode == 200) {
      // Parse the response data as a double
      final List<WaybillEntity> waybillList = response.data.map<WaybillEntity>((json) => WaybillEntity.fromJson(json)).toList();

      return waybillList;
    } else {
      // If the request was not successful, throw an error
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // If any error occurs during the process, throw an error
    throw Exception('Failed to fetch data: $e');
  }
});