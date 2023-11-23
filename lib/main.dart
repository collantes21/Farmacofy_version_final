import 'package:farmacofy/tratamientos1.dart';
import 'package:flutter/material.dart';

import 'package:farmacofy/tratamientos2.dart';
import 'package:farmacofy/tratamientos3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Tratamientos1(),
      routes: {
        ''
        '/tratamientos2': (context) => const Tratamientos2(),
        '/tratamientos3': (context) => const Tratamientos3()
      },
    );
  }
}

