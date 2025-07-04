import 'package:go_router/go_router.dart';
import 'package:pint/screens/Login/Login.dart';
import 'package:pint/screens/Login/Contacto.dart';
import 'package:pint/screens/Login/Reset.dart';
import 'package:pint/screens/Inicio/Inicio.dart';
import 'package:provider/provider.dart';
import 'package:pint/utils/auth_provider.dart';

final rotas = GoRouter(
  initialLocation: '/Login',
  routes: [
    GoRoute(
      name: 'Login',
      path: '/Login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      name: 'Contacto',
      path: '/Contacto',
      builder: (context, state) => Contacto(),
    ),
    GoRoute(
      name: 'Reset',
      path: '/Reset',
      builder: (context, state) => Reset(),
    ),
    GoRoute(
      name: 'TelaPrincipal',
      path: '/TelaPrincipal',
      builder: (context, state) => TelaPrincipal(),
    ),
  ],
  redirect: (context, state) {
    final isLoggedIn = context.read<AuthProvider>().isLoggedIn;
    final isLoginRoute = state.uri.toString() == '/Login';

    // Se não está logado e não está na tela de login → vá para login
    if (!isLoggedIn && !isLoginRoute) return '/Login';

    // Se está logado e está na tela de login → vá para a tela principal
    if (isLoggedIn && isLoginRoute) return '/TelaPrincipal';

    return null; // Nenhum redirecionamento necessário
  },
);