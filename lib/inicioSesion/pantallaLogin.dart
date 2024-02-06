import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:farmacofy/BBDD/bbdd.dart';
import 'package:farmacofy/pages/page_configuracion.dart';
import 'package:farmacofy/pantallaInicial.dart';

// Definir la clase que actúa como un proveedor
class AdminProvider with ChangeNotifier {
  late bool _esAdmin;

  bool get esAdmin => _esAdmin;

  void actualizarEsAdmin(bool esAdmin) {
    _esAdmin = esAdmin;
    notifyListeners(); // Notificar a los consumidores del cambio
  }
}

class LoginPantalla extends StatefulWidget {
  const LoginPantalla({Key? key}) : super(key: key);

  @override
  _LoginPantallaState createState() => _LoginPantallaState();
}

class _LoginPantallaState extends State<LoginPantalla> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
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
                controller: _usuarioController,
                decoration: InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu usuario';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contrasenaController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Contraseña'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu contraseña';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final usuario = _usuarioController.text;
                    final contrasena = _contrasenaController.text;

                    final credencialesCorrectas =
                        await BaseDeDatos.verificarCredenciales(
                            usuario, contrasena);

                    if (credencialesCorrectas) {
                      final bool? esAdmin =
                          await BaseDeDatos.obtenerRolUsuario(usuario);

                      // Obtener el proveedor AdminProvider
                      final adminProvider =
                          Provider.of<AdminProvider>(context, listen: false);

                      // Navegar a la pantalla correspondiente
                      if (esAdmin != null) {
                        if (esAdmin) {
                          // Actualizar el valor de esAdmin en el proveedor
                          adminProvider.actualizarEsAdmin(esAdmin);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PantallaInicial(),
                            ),
                          );
                        } else {
                          adminProvider.actualizarEsAdmin(esAdmin);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PantallaInicial(),
                            ),
                          );
                        }
                      }
                    }
                  } else {
                    // Mostrar un mensaje de error si las credenciales son incorrectas
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Error: Credenciales incorrectas'),
                      ),
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
