import 'package:flutter/material.dart';
import 'login.dart'; // Importamos el archivo login.dart

void main() {
  runApp(const MaterialApp(
    title: 'cooperativa',
    home: FirstRoute(), // Primera pantalla es la de Login
  ));
}

// Primera ruta con el formulario de login
class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: LoginScreen(), // Cargamos la pantalla de login desde login.dart
    );
  }
}
