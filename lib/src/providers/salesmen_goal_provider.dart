import 'package:dio/dio.dart';
import 'package:erantech/src/models/salesman_goal_achieved_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final salesmanGoalProvider  = FutureProvider<List<SalesmanGoalAchievedEntity>>((ref) async {
  const String apiUrl = 'http://192.168.1.12:8081/api/v1/goal/salesmen?startDate=2024-01-01&endDate=2024-03-31';

  try {
    // Create Dio instance
    final dio = Dio();
    // Make HTTP GET request
    final response = await dio.get(apiUrl);

    // Check if the response is successful
    if (response.statusCode == 200) {
      // Parse the response data as a double
      return (response.data as List).map((i) => SalesmanGoalAchievedEntity.fromJson(i)).toList();
    } else {
      // If the request was not successful, throw an error
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // If any error occurs during the process, throw an error
    throw Exception('Failed to fetch data: $e');
  }
});