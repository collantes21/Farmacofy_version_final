// registro_pantalla.dart
import 'package:farmacofy/inicioSesion/pantallaLogin.dart';
import 'package:farmacofy/pantallaInicial.dart';
import 'package:flutter/material.dart';
import 'package:farmacofy/BBDD/bdHelper.dart'; // Asegúrate de importar el archivo correcto

class RegistroPantalla extends StatefulWidget {
  const RegistroPantalla({Key? key}) : super(key: key);

  @override
  _RegistroPantallaState createState() => _RegistroPantallaState();
}

class _RegistroPantallaState extends State<RegistroPantalla> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final TextEditingController _repetirContrasenaController =
      TextEditingController();

  final BaseDeDatosUsuarios _baseDeDatos = BaseDeDatosUsuarios();

  @override
  void dispose() {
    _baseDeDatos.cerrarBaseDeDatos();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegistroMAFAFAKA'),
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
                    return 'Por favor, introduce tu nombre';
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

                  _baseDeDatos.verificarUsuarioExistente(value).then((usuarioExistente) {
                    if (usuarioExistente) {
                      // Mostrar un mensaje de error si las credenciales son incorrectas
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('El usuario ya existe'),
                        ),
                      );
                    }
                  });

                  return null;
                },
              ),
              TextFormField(
                controller: _contrasenaController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Contraseña'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce una contraseña';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _repetirContrasenaController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Repetir Contraseña'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, repite la contraseña';
                  } else if (value != _contrasenaController.text) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final usuarioExistente = await _baseDeDatos.verificarUsuarioExistente(_usuarioController.text);

                    if (usuarioExistente) {
                      print('El nombre de usuario ya está registrado');
                    } else {
                      final nuevoUsuario = Usuario(
                        nombre: _nombreController.text,
                        usuario: _usuarioController.text,
                        contrasena: _contrasenaController.text,
                      );

                      final idUsuario = await _baseDeDatos.registrarUsuario(nuevoUsuario);

                      if (idUsuario > 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Usuario creado correctamente'),
                        ),
                      );

                        // Navegar a la nueva pantalla después de un registro exitoso
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPantalla(), // Reemplaza "PantallaSiguiente" con el nombre de tu siguiente pantalla
                          ),
                        );
                      } else {
                        print('Error al registrar usuario');
                      }
                    }
                  }
                },
                child: const Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

