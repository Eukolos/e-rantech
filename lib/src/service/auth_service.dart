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
    Response response = await dio.post(
      '$baseUrl/api/v1/auth/authenticate',
      data: requestBody,
    );

    String authToken = response.data['token'];
    print(authToken);
    return response.statusCode.toString();
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
