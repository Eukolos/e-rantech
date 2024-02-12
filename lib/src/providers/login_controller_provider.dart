import 'package:erantech/src/models/user.dart';
import 'package:erantech/src/providers/states/login_state.dart';
import 'package:erantech/src/providers/states/token_state.dart';
import 'package:erantech/src/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  void login(String email, String password) async {
    state = const LoginStateLoading();
    User? user = await ref.read(authRepositoryProvider).login(email, password);


    if (user == null) {
      state = const LoginStateError('Kullanıcı Adı veya Şifre Hatalı');
      return;
    }
    else {
      state = LoginStateSuccess(user!);
    }
  }

  void logout() {
    state = const LoginStateInitial();
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});
