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
      title: Text(
        'FarmacoFy',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat', // Establece la fuente personalizada si es necesario
        ),
      ),
      backgroundColor: const Color(0xFF02A724),
      centerTitle: true,
      automaticallyImplyLeading: false, // Evita que aparezca la flecha de regreso
    ),
    body: Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistroPantalla()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF02A724),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16), // Ajusta el espaciado del botón
              ),
              child: Text(
                'Registro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat', // Establece la fuente personalizada si es necesario
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPantalla()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF02A724),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16), // Ajusta el espaciado del botón
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat', // Establece la fuente personalizada si es necesario
                ),
              ),
            ),
            SizedBox(height: 20),
            hayCaida ? ElevatedButton(
              onPressed: () async {
                await llamaEmergencias();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16), // Ajusta el espaciado del botón
              ),
              child: Text(
                'Avisar a Emergencias',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat', // Establece la fuente personalizada si es necesario
                ),
              ),
            ) : SizedBox(), // Utiliza SizedBox para un contenedor vacío
          ],
        ),
      ),
    ),
  );
}

}