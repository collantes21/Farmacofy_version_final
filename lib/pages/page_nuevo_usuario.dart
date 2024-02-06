import 'dart:math';

import 'package:farmacofy/inicioSesion/pantallaLogin.dart';
import 'package:farmacofy/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:farmacofy/BBDD/bbdd.dart';


class AnadirUsuario extends StatefulWidget {
  const AnadirUsuario({Key? key}) : super(key: key);

  @override
  State<AnadirUsuario> createState() => _AnadirUsuarioState();

}

class _AnadirUsuarioState extends State<AnadirUsuario> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Usuario'),
        backgroundColor: const Color(0xFF02A724),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce un nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _usuarioController,
                decoration: InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce un nombre de usuario';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Generar una contraseña automáticamente
                    final String contrasena = _generarContrasena();
                    // Realizar aquí la lógica para añadir el usuario con la contraseña generada
                    final String usuario = _usuarioController.text;
                    final String nombre = _nombreController.text;

                    // Obtener el id del usuario del proveedor
                    final usuarioProvider = context.read<IdSupervisor>();
                    final int idAdministrador = usuarioProvider.idUsuario;
                    // Crear una instancia de Usuario
                    final nuevoUsuario = Usuario.withData(
                        nombre: _nombreController.text,
                        usuario: _usuarioController.text,
                        contrasena: contrasena,
                        administrador: false,
                        idAdministrador:idAdministrador, // Aquí usamos el valor que acabamos de establecer
                      );

                    // Registrar el usuario en la base de datos
                    int idUsuario = await BaseDeDatos.registrarUsuario(nuevoUsuario);

                    // Mostrar mensaje de éxito
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Usuario añadido correctamente. Contraseña: $contrasena, ID Usuario: $idAdministrador'),
                      ),
                    );

                    // Limpiar los campos del formulario después de agregar el usuario
                    _usuarioController.clear();
                    _nombreController.clear();
                  }
                },
                child: const Text('Añadir Usuario'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _generarContrasena() {
  // Caracteres válidos para generar la contraseña
  const caracteres = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();
  // Generar una cadena de 8 caracteres seleccionando al azar de la lista de caracteres
  return String.fromCharCodes(Iterable.generate(8, (_) => caracteres.codeUnitAt(random.nextInt(caracteres.length))));
}

// class _AnadirUsuarioState extends State<AnadirUsuario> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _usuarioController = TextEditingController();
//   final TextEditingController _nombreController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Añadir Usuario'),
//         backgroundColor: const Color(0xFF02A724),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nombreController,
//                 decoration: InputDecoration(labelText: 'Nombre'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Por favor, introduce un nombre';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _usuarioController,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'Usuario'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Por favor, introduce un nombre de usuario';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Generar una contraseña automáticamente
//                     final String contrasena = _generarContrasena();
//                     // Realizar aquí la lógica para añadir el usuario con la contraseña generada
//                     final String usuario = _usuarioController.text;
//                     final String nombre = _nombreController.text;

//                     // Obtener el id del usuario del proveedor
//                     final usuarioProvider = context.read<IdSupervisor>();
//                     final int idUsuario = usuarioProvider.idUsuario;

//                     // Lógica para añadir usuario...
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('Usuario añadido correctamente. Contraseña: $contrasena, ID Usuario: $idUsuario'),
//                       ),
//                     );
//                     // Limpiar los campos del formulario después de agregar el usuario
//                     _usuarioController.clear();
//                     _nombreController.clear();
//                   }
//                 },
//                 child: const Text('Añadir Usuario'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


