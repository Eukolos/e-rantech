import 'package:dio/dio.dart';
import 'package:erantech/src/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


class AuthService {
  Future<User?> login(String email, String password) async {
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
      final jwt = response.data['token'];
      var decodedData = JwtDecoder.decode(jwt);
      User user = User.fromJson(decodedData, jwt);

      return user;
    } catch (e) {
      return null;
    }
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());
