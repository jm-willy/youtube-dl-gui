import 'package:flutter/material.dart';

void main() {
  runApp(LandingPageApp());
}

class LandingPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INICIO'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagen o logo
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/landing_image.jpg'), // Añade tu imagen en assets
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Título principal
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Bienvenidos',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 20),

            // Texto descriptivo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Aquí puedes encontrar información relevante sobre nuestro producto.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 40),

            // Botón de llamada a la acción (CTA)
            ElevatedButton(
              onPressed: () {
                // Acción del botón
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                backgroundColor: Colors.teal,
              ),
              child: Text(
                'LOGIN',
                style: TextStyle(fontSize: 18),
              ),
            ),

            SizedBox(height: 40),

            // Pie de página con enlaces
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '© 2024 Cooperativa de aceite.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
