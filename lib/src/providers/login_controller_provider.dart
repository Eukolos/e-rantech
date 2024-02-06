import 'package:erantech/src/providers/states/login_state.dart';
import 'package:erantech/src/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  void login(String email, String password) async {
    state = const LoginStateLoading();
    String msg = '';
    String status =
        await ref.read(authRepositoryProvider).login(email, password);
    print(status ?? 'error');
    if (int.parse(status) == 500) {
      msg = 'Server Hatası Daha Sonra Tekrar Deneyin';
      state = const LoginStateError('Server Hatası Daha Sonra Tekrar Deneyin');
      return;
    } else if (int.parse(status) == 401) {
      msg = 'Kullanıcı Adı veya Şifre Hatalı';
      state = const LoginStateError('Kullanıcı Adı veya Şifre Hatalı');
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
