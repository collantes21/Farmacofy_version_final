import 'package:farmacofy/tratamientos1.dart';
import 'package:flutter/material.dart';

class pantallaInicial extends StatelessWidget {
  const pantallaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmacoFy'),
        backgroundColor: const Color(0xFF02A724),
        actions: [
          IconButton(
            onPressed: () {
              // Lógica para ir a la página de ajustes
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView(
        children: const [
          // Espacio en blanco arriba
          SizedBox(height: 20.0),
          // Contenido principal de la página
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para el botón de añadir
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Tratamientos1()),
          );
        },
        backgroundColor: const Color(0xFF02A724),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication_sharp),
            label: 'Tratamientos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy_rounded),
            label: 'Almacén',
          ),
        ],
        selectedItemColor: const Color(0xFF02A724),
        onTap: (index) {
          // Lógica para manejar la selección de ítem
        },
      ),
    );
  }
}



