import 'package:flutter/material.dart';

class OfferPage extends StatelessWidget {
  final List<Map<String, dynamic>> announcements = [
    {
      'title': 'Nuevo Aceite de Oliva Virgen Extra',
      'description':
          'Estamos emocionados de anunciar la llegada de nuestro nuevo aceite de oliva virgen extra, cultivado de manera sostenible.',
      'date': '20/10/2024',
    },
    {
      'title': 'Participación en la Feria Local',
      'description':
          'Visítanos en la feria local este fin de semana y descubre nuestros productos.',
      'date': '18/10/2024',
    },
    {
      'title': 'Descuento Especial para Miembros',
      'description':
          'Todos los miembros de la cooperativa reciben un 10% de descuento en su próxima compra.',
      'date': '15/10/2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tablón de Anuncios'),
        backgroundColor: const Color.fromARGB(255, 190, 228, 164),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: announcements.length,
          itemBuilder: (context, index) {
            final announcement = announcements[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      announcement['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      announcement['description'],
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Fecha: ${announcement['date']}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
