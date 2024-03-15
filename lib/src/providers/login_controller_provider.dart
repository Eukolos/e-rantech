import 'package:erantech/src/models/user.dart';
import 'package:erantech/src/providers/states/login_state.dart';
import 'package:erantech/src/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial()) {
    checkToken();
  }

  final Ref ref;

  void login(String email, String password) async {
    state = const LoginStateLoading();
    User? user = await ref.read(authRepositoryProvider).login(email, password);

    if (user == null) {
      state = const LoginStateError('Kullanıcı Adı veya Şifre Hatalı');
      return;
    }
    else {
      // Save the token in shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user.token);

      state = LoginStateSuccess(user!);
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  void checkToken() async {
    final token = await getToken();
    if (token != null && token.isNotEmpty) {
      var decodedData = JwtDecoder.decode(token);
      User user = User.fromJson(decodedData, token);

      state = LoginStateSuccess(user);
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    state = const LoginStateInitial();
  }
}
final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});
