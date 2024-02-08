

import 'package:farmacofy/modo/modo_trabajo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaginaConfiguracion extends StatefulWidget {
  const PaginaConfiguracion({super.key});

  @override
  State<PaginaConfiguracion> createState() => _PaginaConfiguracionState();
}

class _PaginaConfiguracionState extends State<PaginaConfiguracion> {
  
  @override
Widget build(BuildContext context) {

  final modoTrabajo = Provider.of<ModoTrabajo>(context);

  return Scaffold(
    appBar: AppBar(
      title: const Text('Configuración'),
      backgroundColor: const Color(0xFF02A724),
      flexibleSpace: Container( //Sirve para definir el color de la barra de estado
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF02A724),
              Color.fromARGB(255, 18, 240, 63),
              Color.fromARGB(255, 11, 134, 34),
            ],
          ),
        ),
      ),
      centerTitle: true,
      leading: IconButton( // Agrega el botón de flecha en la parte izquierda de la AppBar
        icon: Icon(Icons.arrow_back), // Icono de la flecha hacia atrás
        onPressed: () {
          Navigator.of(context).pop(); // Función para volver a la pantalla anterior
        },
      ),
    ),
    body: Center(
      child: ListView(
        children: [
          const ListTile(
            title:  Text(
              "Ajustes generales",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SwitchListTile(
            title: const Text(
              "Funcionamiento local",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            value: modoTrabajo.modoLocal,
            onChanged: (value) {
              modoTrabajo.modoLocal = value;
            },
          ),
        ],
      ),
    ),
  );
}
}

