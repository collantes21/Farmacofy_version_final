import 'package:farmacofy/pages/page_nuevo_usuario.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
 
void main() {
  testWidgets('Test en la pantalla AnadirUsuario', (WidgetTester tester) async {
    // Construir widget
    await tester.pumpWidget(MaterialApp(home: AnadirUsuario()));
 
    // Verificar el texto
    expect(find.text('Nombre'), findsOneWidget);
 
    // Verificar se o teste passou e imprimir uma mensagem na console
    if (tester.takeException() == null) {
      print('Test correcto!');
    }
  });
}