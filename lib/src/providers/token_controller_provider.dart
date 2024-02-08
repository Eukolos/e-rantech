
import 'package:erantech/src/models/user.dart';
import 'package:erantech/src/providers/states/token_state.dart';
import 'package:erantech/src/repository/token_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TokenController extends StateNotifier<TokenState> {
  TokenController(this.ref) : super(const TokenStateInitial());

  final Ref ref;

  void token(String token) async {
    state = const TokenStateLoading();
    try {
      User user = await ref.read(tokenRepositoryProvider).tokenExtraction(token);
      print(user);
      state = const TokenStateSuccess();
    } catch (e) {
      state = TokenStateError(e.toString());
    }
  }
}

final tokenControllerProvider =
StateNotifierProvider<TokenController, TokenState>((ref) {
  return TokenController(ref);
});