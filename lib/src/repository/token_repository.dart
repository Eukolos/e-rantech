import 'package:erantech/src/models/user.dart';
import 'package:erantech/src/service/token_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TokenRepository {
  final TokenService _tokenService;

  TokenRepository(this._tokenService);

  Future<User> tokenExtraction(String token) async {
    return _tokenService.tokenExtraction(token);
  }
}

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  return TokenRepository(ref.read(tokenServiceProvider));
});
