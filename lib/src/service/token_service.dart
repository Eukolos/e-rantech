import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
class TokenService {
  Future<String> tokenExtraction(String token) async {
    var decodedData = JwtDecoder.decode(token);
    print(decodedData);
    return token;
  }
}

final tokenServiceProvider = Provider<TokenService>((ref) => TokenService());
