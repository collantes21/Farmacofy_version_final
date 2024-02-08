import 'dart:async';

import 'package:farmacofy/services/caida_services.dart';
import 'package:flutter/material.dart';
import 'pantallaRegistro.dart'; // Importa el archivo de la pantalla de registro
import 'pantallaLogin.dart'; // Importa el archivo de la pantalla de inicio de sesión
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class InicioPantalla extends StatefulWidget {
  const InicioPantalla({Key? key}) : super(key: key);

  @override
  State<InicioPantalla> createState() => _InicioPantallaState();
}

class _InicioPantallaState extends State<InicioPantalla> {
  final int bufferSize = 100;

  List<Map<String,dynamic>> bufferAcelerometro=[];

  bool hayCaida = false;

  //Lista para almacenar los datos de las multiples suscripciones a los sensores
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  //Buffer para almacenar los datos del giroscopio
  List<Map<String,dynamic>> gyroscopeBuffer = [];

  //Buffer para almacenar los datos del acelerometro
  List<Map<String,dynamic>> accelerationBuffer = [];

  //Variables para almacenar los datos del giroscopio
  GyroscopeEvent? _eventoGiroscopio;

  //Variables para almacenar los datos del acelerometro
  AccelerometerEvent? _accelerometerEvent;

  @override
  void initState() {
    super.initState();
    
    //Añadimos las suscripciones a los sensores
    _streamSubscriptions.add(
      gyroscopeEventStream(
        //frecuencia de muestreo de 100ms
        samplingPeriod: Duration(milliseconds: 100)
        ).listen((GyroscopeEvent event) {
      
      //Cada vez que se recibe un dato del giroscopio se añade al buffer, 
      //si el buffer supera el tamaño maximo se elimina el primer dato
      setState(() {
        _eventoGiroscopio = event;
        gyroscopeBuffer.add(
          {
            "x": event.x,
            "y": event.y,
            "z": event.z,
          });
          if(gyroscopeBuffer.length > bufferSize){
            gyroscopeBuffer.removeAt(0);
          }

      });
    },
    
    ));
    _streamSubscriptions.add(
      accelerometerEventStream(samplingPeriod: Duration(milliseconds: 100)).listen(
        (AccelerometerEvent event) {
          setState(() {
            _accelerometerEvent = event;
            //una caida se produciría cuando el valor de la aceleración en el eje z supera el valor de 10
            bufferAcelerometro.add(
              {
                "x": event.x,
                "y": event.y,
                "z": event.z,
              });
            //si el buffer supera el tamaño maximo se elimina el primer dato
            if(accelerationBuffer.length > bufferSize){
              accelerationBuffer.removeAt(0);
            }
            //si el valor de la aceleración en el eje z supera el valor de 10 se muestra una notificación
            if(event.z > 40){
              mostrarNotification("Emergencia", "Se ha detectado una caida");
              hayCaida = true;
            }
          }); 
        },
        
      ),
    );
    
  }

  @override
  void dispose() {
      super.dispose();
      for (final subscription in _streamSubscriptions) {
        subscription.cancel();
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmacoFy'),
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
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Puedes cambiar esto a cualquier color que desees
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'FarmacoFy',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistroPantalla()),
                  );
                },
                child: const Text('Registro'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPantalla()),
                  );
                },
                child: const Text('Login'),
              ),
              (hayCaida) ? ElevatedButton(
                  onPressed: ()async {await llamaEmergencias();}, //Asignamos la funcion llamaEmergencias al boton
                  style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          onPrimary: Colors.white,
                          onSurface: Colors.grey,
                  ),
                  child: Text(
                            'Avisar a Emergencias',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                  ),))  : Text(''),
            ],
          ),
        ),
      ),
    );
    
  }
}

void main() {
  runApp(const MaterialApp(
    home: InicioPantalla(),
  ));
}
