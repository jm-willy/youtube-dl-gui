import 'package:flutter/material.dart';

// Albaranes todo ancho, numeracion relativa al total, desde temporadas, quitar barra de pagina, añadir anuncios boton flotante

class ReceiptPage extends StatelessWidget {
  final List<Map<String, dynamic>> receipts = [
    {
      'albaran': '1',
      'socio': '1987',
      'date': '20/10/2024',
      'poligono': '7',
      'parcela': '23',
      'neto': '701',
      'rendto': '12',
      'humedad': '0.00',
      'acidez': '0.00',
      'calidad': 'verde',
    },
    {
      'albaran': '2',
      'socio': '2456',
      'date': '21/10/2024',
      'poligono': '8',
      'parcela': '32',
      'neto': '890',
      'rendto': '10',
      'humedad': '1.00',
      'acidez': '0.50',
      'calidad': 'extra',
    },
  ];
  Widget dividerBar = const Divider(
    height: 1,
    thickness: 2,
    indent: 0,
    endIndent: 0,
    color: Color.fromARGB(255, 0, 0, 0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recibos y Albaranes'),
        backgroundColor: const Color.fromARGB(255, 150, 200, 130),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: ListView.builder(
          itemCount: receipts.length,
          itemBuilder: (context, index) {
            final receipt = receipts[index];
            return Card(
              elevation: 8,
              margin: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRow('Albarán:', receipt['albaran']),
                    dividerBar,
                    _buildRow('Socio:', receipt['socio']),
                    dividerBar,
                    _buildRow('Fecha:', receipt['date']),
                    dividerBar,
                    _buildRow('Polígono:', receipt['poligono']),
                    dividerBar,
                    _buildRow('Parcela:', receipt['parcela']),
                    dividerBar,
                    _buildRow('Neto (kg):', receipt['neto']),
                    dividerBar,
                    _buildRow('Rendimiento (%):', receipt['rendto']),
                    dividerBar,
                    _buildRow('Humedad (%):', receipt['humedad']),
                    dividerBar,
                    _buildRow('Acidez (%):', receipt['acidez']),
                    dividerBar,
                    _buildRow('Calidad:', receipt['calidad']),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
