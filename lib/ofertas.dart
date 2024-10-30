import 'package:flutter/material.dart';
import 'colores.dart';

class OfferPage extends StatefulWidget {
  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  final List<Map<String, dynamic>> announcements = [
    {
      'title': 'Participación en la Feria Local',
      'description':
          'Visítanos en la feria local este fin de semana y descubre nuestros productos.',
      'date': '18/10/2024',
    },
  ];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void _showForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _addAnnouncement();
                  Navigator.pop(context);
                },
                child: const Text('Enviar'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _addAnnouncement() {
    final newAnnouncement = {
      'title': titleController.text,
      'description': descriptionController.text,
      'date': DateTime.now().toString().substring(0, 10),
    };

    setState(() {
      announcements.insert(0, newAnnouncement);
    });

    titleController.clear();
    descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ofertas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: announcements.length,
          itemBuilder: (context, index) {
            final announcement = announcements[index];
            return Card(
              color: myContainerColor,
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
      floatingActionButton: FloatingActionButton(
        onPressed: _showForm,
        backgroundColor: myButtonColor,
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.edit_note,
          size: 40,
        ),
      ),
    );
  }
}
