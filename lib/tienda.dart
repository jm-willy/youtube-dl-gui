import 'package:flutter/material.dart';

class TiendaPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Aceite de Oliva Virgen Extra',
      'price': 10.99,
      'image': 'https://via.placeholder.com/150', // URL imagen
    },
    {
      'name': 'Aceite de Oliva Suave',
      'price': 8.99,
      'image': 'https://via.placeholder.com/150', // URL imagen
    },
    {
      'name': 'Aceite de Oliva Orgánico',
      'price': 12.99,
      'image': 'https://via.placeholder.com/150', // URL imagen
    },
    // Agregar más productos si es necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tienda de Aceite'),
        backgroundColor: const Color.fromARGB(255, 150, 200, 130),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Dos productos por fila
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.85, // Ajustar el tamaño de las tarjetas
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      product['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      '${product['price'].toString()}€',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 150, 200, 130),
                    ),
                    onPressed: () {
                      // Lógica para agregar al carrito
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('${product['name']} añadido al carrito'),
                        ),
                      );
                    },
                    child: const Text('Añadir al carrito'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
