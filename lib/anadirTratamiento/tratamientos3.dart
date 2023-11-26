import 'package:farmacofy/anadirTratamiento/tratamientos4.dart';
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
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Añadido para centrar verticalmente también
                children: [
                  Container( 
                    child: const Image(
                      image: NetworkImage(
                          "https://cdn-icons-png.flaticon.com/512/3889/3889548.png"),
                      width: 200,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "Indica la hora de la primera toma:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50), // Ajusta el espacio entre el texto y la hora
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Seleccione hora: ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20), // Ajusta el espacio entre el texto y la hora
                    Row(
                      children: [
                        Text(
                          "${selectedDate.hour}:${selectedDate.minute}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(width: 20), // Ajusta el espacio entre el texto y el icono
                        Icon(
                          Icons.access_time, // Puedes cambiar esto al icono que desees
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50), // Separa el listView del título.
                  const Text(
                    "Indica la hora de la segunda toma:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Seleccione hora: ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20), // Ajusta el espacio entre el texto y la hora
                    Row(
                      children: [
                        Text(
                          "${selectedDate.hour}:${selectedDate.minute}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(width: 20), // Ajusta el espacio entre el texto y el icono
                        Icon(
                          Icons.access_time, // Puedes cambiar esto al icono que desees
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          
        ),
      ),
      
      // Añadir el botón en la parte inferior
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Tratamientos4()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF02A724), // Color del botón
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0), // Ajuste del espacio interno
            child: Text(
              'Siguiente',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
