import 'package:flutter/material.dart';


class Tratamientos3 extends StatelessWidget {
  const Tratamientos3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF02A724),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
            icon: const Icon(Icons.settings),
          ),
        ],
        title: const Center(
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
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [   
              const Text(
                "Seleccione la hora de la toma",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      height: 270,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 80.0),
                      child: const Image(
                image: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/3889/3889548.png"),
                  width: 200,
                  height: 100,
              ),
                  )
                ]
                ),
              ),
            const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Hora Seleccionada: ${selectedDate.hour}:${selectedDate.minute}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 140), // Separa el listView del título.
            ],
          ),
        ),
      ),
    );
  }
}
