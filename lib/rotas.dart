import 'package:go_router/go_router.dart';
import 'Login.dart';
import 'Inicio.dart';

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
        builder: (context, state) => TelaPrincipal()
    ),
  ],
);