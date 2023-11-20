import 'package:flutter/material.dart';

class Tratamientos2 extends StatelessWidget {
  const Tratamientos2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF02A724),
        // Agregamos un IconButton con un icono de flecha hacia atrás en el lado izquierdo de la AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Vuelve a la pantalla anterior
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Acción del botón de ajustes (aún no implementada)
              // final destino=MaterialPageRoute(
              //   // builder: (_)=>PaginaAjustes());
              //   Navigator.push(context, destino);
            },
            icon: Icon(Icons.settings),
          ),
        ],
        title: Center(
          // Centro del texto 'FarmacoFy' en la AppBar
          child: Text(
            'FarmacoFy',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 8,
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.grey,
            fontSize: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Seleccione la frecuencia de toma",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 140),//Separa el listView del titulo.
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Elementos de la lista de selección con títulos y acciones onTap (aún no implementadas)
                  ListTile(
                    title: Text('Una vez al día'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('2 veces al día'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('3 veces al día'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Definirlo manualmente'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('No quiero establecer frecuencia'),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
