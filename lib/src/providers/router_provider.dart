
import 'package:erantech/src/views/home_screen.dart';
import 'package:erantech/src/providers/login_controller_provider.dart';
import 'package:erantech/src/providers/states/login_states.dart';
import 'package:erantech/src/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);
  return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: router,
      redirect: router._redirectLogic,
      routes: router._routes);
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<LoginState>(
      loginControllerProvider,
          (_, __) => notifyListeners(),
    );
  }

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    final loginState = _ref.read(loginControllerProvider);

    final areWeLoggingIn = state.matchedLocation == '/login';
    print(state.matchedLocation);

    if (loginState is LoginStateInitial) {
      return areWeLoggingIn ? null : '/login';
    }

    if (areWeLoggingIn) return '/';

    return null;
  }



  List<GoRoute> get _routes => [
    GoRoute(
      name: 'login',
      builder: (context, state) => const LoginScreen(),
      path: '/login',
    ),
    GoRoute(
      name: 'home',
      builder: (context, state) => const HomeScreen(title: 'emin',),
      path: '/',
    ),
  ];
}