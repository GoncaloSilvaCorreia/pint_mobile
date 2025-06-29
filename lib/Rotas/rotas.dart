import 'package:go_router/go_router.dart';
import 'package:pint/screens/Login/Login.dart';
import 'package:pint/screens/Login/Contacto.dart';
import 'package:pint/screens/Login/Reset.dart';
import 'package:pint/screens/Inicio/Inicio.dart';

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