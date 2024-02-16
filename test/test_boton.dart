import 'package:farmacofy/inicioSesion/pantallaLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Tiene que aparecer un boton con el nombre Login', (WidgetTester tester) async {
    // da acceso a la pantalla indicada
    await tester.pumpWidget(MaterialApp(home: LoginPantalla()));
 
    // Verifica si el boton con ese texto esta presente
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });
}