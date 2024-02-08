import 'package:erantech/src/providers/states/login_state.dart';
import 'package:erantech/src/providers/states/token_state.dart';
import 'package:erantech/src/providers/token_controller_provider.dart';
import 'package:erantech/src/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  void login(String email, String password) async {
    state = const LoginStateLoading();
    String status =
        await ref.read(authRepositoryProvider).login(email, password);
    print(status ?? 'error');
    TokenState token = ref.read(tokenControllerProvider.notifier).state;


    if (int.parse(status) == 500 || token is TokenStateError) {
      state = const LoginStateError('Server Hatası Daha Sonra Tekrar Deneyin');
      return;
    } else if (int.parse(status) == 401 || int.parse(status) == 403) {
      state = const LoginStateError('Kullanıcı Adı veya Şifre Hatalı');
      return;
    }
    else if ((int.parse(status) >= 200 && int.parse(status) < 300) || token is TokenStateSuccess) {
      state = const LoginStateSuccess();
    }
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});
