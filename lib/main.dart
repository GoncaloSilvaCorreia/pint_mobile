import 'package:flutter/material.dart';
import 'Rotas/rotas.dart';

void main() {
  runApp(const SoftinsaLoginApp());
}

class SoftinsaLoginApp extends StatelessWidget {
  const SoftinsaLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: rotas,
      title: 'Softinsa Login',
    );
  }
}