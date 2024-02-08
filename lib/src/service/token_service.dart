import 'package:erantech/src/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
class TokenService {
  Future<User> tokenExtraction(String token) async {
    var decodedData = JwtDecoder.decode(token);
    print(decodedData);
    try {
      User user = User.fromJson(decodedData, token);
      return user;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}

final tokenServiceProvider = Provider<TokenService>((ref) => TokenService());
