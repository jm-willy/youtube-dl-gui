import 'package:flutter/material.dart';

import 'inicio.dart';
import 'login.dart';

void main() {
  runApp(const MaterialApp(
    title: 'cooperativa',
    home: App(), // Primera pantalla es la de Login
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Widget openingPage = const LoginScreen();
    if (userLogged) {
      openingPage = const MyHomePage();
    }

    return MaterialApp(
      title: 'Cooperativa',
      debugShowCheckedModeBanner: false,
      home: openingPage,
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color.fromARGB(222, 16, 96, 0)),
    );
  }
}
