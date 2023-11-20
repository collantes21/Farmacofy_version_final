import 'package:flutter/material.dart';

class pantallaInicial extends StatelessWidget {
  const pantallaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FarmacoFy'),
        backgroundColor: Color(0xFF02A724),
        actions: [
          IconButton(
            onPressed: () {
              // Lógica para ir a la página de ajustes
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView(
        children: [
          // Espacio en blanco arriba
          SizedBox(height: 20.0),

          // Contenido principal de la página
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Contenido de la página aquí'),
          ),

          // ListView de 4 campos
          ListTile(
            title: Text('Campo 1'),
            // Puedes personalizar cada ListTile según tus necesidades
          ),
          ListTile(
            title: Text('Campo 2'),
          ),
          ListTile(
            title: Text('Campo 3'),
          ),
          ListTile(
            title: Text('Campo 4'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para el botón de añadir
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF02A724),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
        selectedItemColor: Color(0xFF02A724),
        onTap: (index) {
          // Lógica para manejar la selección de ítem
        },
      ),
    );
  }
}
