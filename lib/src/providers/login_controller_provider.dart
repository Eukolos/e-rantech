import 'package:erantech/src/providers/states/login_states.dart';
import 'package:erantech/src/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  void login(String email, String password) async {
    state = const LoginStateLoading();
    String status =
        await ref.read(authRepositoryProvider).login(email, password);
    if (int.parse(status) > 250) {
      state = const LoginStateError('error');
      return;
    } else {
      state = const LoginStateSuccess();
    }
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});
