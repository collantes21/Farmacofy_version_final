// registro_pantalla.dart
import 'package:farmacofy/BBDD/bbdd.dart';
import 'package:farmacofy/inicioSesion/pantallaLogin.dart';
import 'package:farmacofy/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:farmacofy/BBDD/bdHelper_old.dart';

class Medicamento {
  bool activado = false; // Puedes ajustar según tus necesidades
}

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

  late BaseDeDatos _baseDeDatos;
  late ThemeData tema;
  late Medicamento medicamento;

  @override
  void initState() {
    super.initState();
    _baseDeDatos = BaseDeDatos();
    BaseDeDatos.inicializarBD();

    tema = ThemeData.light(); // Puedes ajustar esto según tu implementación
    medicamento = Medicamento(); // Inicialización de la variable medicamento
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
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

                  BaseDeDatos.verificarUsuarioExistente(value)
                      .then((usuarioExistente) {
                    if (usuarioExistente) {
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
              CheckboxListTile(
                title: Text(
                  "Usuario Administrador",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: tema.colorScheme.secondary,
                  ),
                ),
                value: medicamento.activado,
                onChanged: (bool? value) {
                  setState(() {
                    medicamento.activado = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    BaseDeDatos.inicializarBD();
                    final usuarioExistente =
                        await BaseDeDatos.verificarUsuarioExistente(
                            _usuarioController.text);

                    if (usuarioExistente) {
                      print('El nombre de usuario ya está registrado');
                    } else {
                      var idAdministrador = null;
                      var value = idAdministrador ??
                          0; // Aquí usamos 0 como valor predeterminado

                      final nuevoUsuario = Usuario.withData(
                        nombre: _nombreController.text,
                        usuario: _usuarioController.text,
                        contrasena: _contrasenaController.text,
                        administrador: medicamento.activado,
                        idAdministrador:
                            value, // Aquí usamos el valor que acabamos de establecer
                      );

                      final idUsuario =
                          await BaseDeDatos.registrarUsuario(nuevoUsuario);

                      if (idUsuario > 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Usuario creado correctamente'),
                          ),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPantalla(),
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
