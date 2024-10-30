import 'package:flutter/material.dart';
import 'package:flutter_application_1/colores.dart';

import 'recibos.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> temporadas = [
      'Temporada 2021',
      'Temporada 2022',
      'Temporada 2023',
      'Temporada 2024',
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione una temporada para ver datos:',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            for (var temporada in temporadas)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 4,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: myButtonColor),
                  onPressed: () {
                    showDialog(
                      barrierColor: Color.fromARGB(133, 0, 11, 0),
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: myScaffoldColor,
                          insetPadding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                          title: Text('Datos de $temporada'),
                          content: ReceiptPage(),
                          elevation: 5,
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cerrar',
                                  style: TextStyle(
                                    fontSize: 19.5,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        temporada,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataEntryCards() {
    final List<String> fields = [
      'Albarán',
      'Socio',
      'Término',
      'Polígono',
      'Parcela',
      'Paraje',
      'Neto',
      'Rendto',
      'Humedad',
      'Acidez',
      'Calidad',
    ];

    return Column(
      children: fields.map((field) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  field,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Ingrese $field',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
