import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthService {
  Future<String> login(String email, String password) async {
    Dio dio = Dio();

    const String baseUrl = 'http://192.168.1.141:8081';

    Map<String, dynamic> requestBody = {
      'email': email,
      'password': password,
    };


    try {
      Response response = await dio.post(
        '$baseUrl/api/v1/auth/login',
        data: requestBody,
      );
      print(response.data);
      return response.data['status'];
    } catch (e) {
      print("Error from dio catch: $e");
      return "500";
    }
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
