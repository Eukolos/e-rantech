import 'package:dio/dio.dart';
import 'package:erantech/src/providers/token_controller_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';


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
        '$baseUrl/api/v1/auth/authenticate',
        data: requestBody,
      );
      final loginController = ProviderContainer().read(tokenControllerProvider.notifier);
      final jwt = response.data['token'];
      loginController.token(jwt);

      // i wanna parse wi
      return response.statusCode.toString();
    } catch (e) {
      print("Error from dio catch: $e");
      return "500";
    }
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
