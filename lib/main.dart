import 'package:farmacofy/almacen.dart';
import 'package:farmacofy/inicioSesion/pantallaLogin.dart';
import 'package:farmacofy/inicioSesion/pantallaRegistroLogin.dart';
import 'package:farmacofy/instruccionesUsuario.dart';
import 'package:farmacofy/modo/modo_supervisor.dart';
import 'package:farmacofy/modo/modo_trabajo.dart';
import 'package:flutter/material.dart';
import 'package:farmacofy/anadirTratamiento/tratamientos2.dart';
import 'package:farmacofy/anadirTratamiento/tratamientos3.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ModoTrabajo()),
      ChangeNotifierProvider(create: (_) => ModoSupervisor()),
      ChangeNotifierProvider(create: (_) => AdminProvider()),
      ChangeNotifierProvider(create: (_) => IdSupervisor())

    ],
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const InicioPantalla(),
      routes: {
        '/intruccionesUsuario': (context) => const InstruccionesUsuario(),
        '/tratamientos2': (context) => const Tratamientos2(),
        '/tratamientos3': (context) => const Tratamientos3(),
        '/compraFarmacia':(context) => const Almacen(),
      },
    );
  }
}

