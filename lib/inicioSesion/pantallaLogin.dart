import 'package:farmacofy/pages/page_listado_tratamientos.dart';
import 'package:farmacofy/pages/page_listado_usuarios.dart';
import 'package:flutter/material.dart';
import 'package:farmacofy/BBDD/bbdd.dart';
import 'package:farmacofy/pages/page_listado_tratamientos.dart';
import 'package:farmacofy/pages/page_listado_usuarios.dart';
import 'package:provider/provider.dart';

class AdminProvider with ChangeNotifier {
  late bool _esAdmin;

  bool get esAdmin => _esAdmin;

  void actualizarEsAdmin(bool esAdmin) {
    _esAdmin = esAdmin;
    notifyListeners(); // Notificar a los consumidores del cambio
  }
}

class IdSupervisor with ChangeNotifier {
  late int _idUsuario;

  int get idUsuario => _idUsuario;

  void actualizarIdUsuario(int idUsuario) {
    _idUsuario = idUsuario;
    notifyListeners();
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

  bool _credencialesIncorrectas = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
        backgroundColor: const Color(0xFF02A724),
        flexibleSpace: Container(
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usuarioController,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  errorText: _credencialesIncorrectas
                      ? 'Credenciales incorrectas'
                      : null,
                  focusedBorder: _credencialesIncorrectas
                      ? OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        )
                      : null,
                ),
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
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  errorText: _credencialesIncorrectas
                      ? 'Credenciales incorrectas'
                      : null,
                  focusedBorder: _credencialesIncorrectas
                      ? OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        )
                      : null,
                ),
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
                      final int? idUsuario =
                          await BaseDeDatos.obtenerIdUsuario(usuario);

                      final adminProvider =
                          Provider.of<AdminProvider>(context, listen: false);
                      final usuarioProvider =
                          Provider.of<IdSupervisor>(context, listen: false);

                      if (idUsuario != null) {
                        usuarioProvider.actualizarIdUsuario(idUsuario);
                      }

                      if (esAdmin != null) {
                        if (esAdmin) {
                          adminProvider.actualizarEsAdmin(esAdmin);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListadoUsuarios(),
                            ),
                          );
                        } else {
                          adminProvider.actualizarEsAdmin(esAdmin);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListadoTratamientos(),
                            ),
                          );
                        }
                      }
                    } else {
                      setState(() {
                        _credencialesIncorrectas = true;
                      });
                      _contrasenaController.clear();
                    }
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





















// // Definir la clase que actúa como un proveedor
// class AdminProvider with ChangeNotifier {
//   late bool _esAdmin;

//   bool get esAdmin => _esAdmin;

//   void actualizarEsAdmin(bool esAdmin) {
//     _esAdmin = esAdmin;
//     notifyListeners(); // Notificar a los consumidores del cambio
//   }
// }

// class idUsuarioSupervisor with ChangeNotifier{

// }

// class LoginPantalla extends StatefulWidget {
//   const LoginPantalla({Key? key}) : super(key: key);

//   @override
//   _LoginPantallaState createState() => _LoginPantallaState();
// }

// class _LoginPantallaState extends State<LoginPantalla> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _usuarioController = TextEditingController();
//   final TextEditingController _contrasenaController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Inicio de Sesión'),
//         backgroundColor: const Color(0xFF02A724),
//         flexibleSpace: Container( //Sirve para definir el color de la barra de estado
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
                  
//                   Color(0xFF02A724),
//                   Color.fromARGB(255, 18, 240, 63),
//                   Color.fromARGB(255, 11, 134, 34),
                  
//                 ],
//               ),
//             ),
//           ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _usuarioController,
//                 decoration: InputDecoration(labelText: 'Usuario'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Por favor, introduce tu usuario';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _contrasenaController,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'Contraseña'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Por favor, introduce tu contraseña';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState?.validate() ?? false) {
//                     final usuario = _usuarioController.text;
//                     final contrasena = _contrasenaController.text;

//                     final credencialesCorrectas =
//                         await BaseDeDatos.verificarCredenciales(
//                             usuario, contrasena);

//                     if (credencialesCorrectas) {
//                       final bool? esAdmin =
//                           await BaseDeDatos.obtenerRolUsuario(usuario);

//                           await BaseDeDatos.obtenerIdUsuario(usuario); 

//                       // Obtener el proveedor AdminProvider
//                       final adminProvider =
//                           Provider.of<AdminProvider>(context, listen: false);

//                       // Navegar a la pantalla correspondiente
//                       if (esAdmin != null) {
//                         if (esAdmin) {
//                           // Actualizar el valor de esAdmin en el proveedor
//                           adminProvider.actualizarEsAdmin(esAdmin);
                          
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ListadoUsuarios(),
//                             ),
//                           );
//                         } else {
//                           adminProvider.actualizarEsAdmin(esAdmin);
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => PantallaInicial(),
//                             ),
//                           );
//                         }
//                       }
//                     }
//                   } else {
//                     // Mostrar un mensaje de error si las credenciales son incorrectas
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Error: Credenciales incorrectas'),
//                       ),
//                     );
//                   }
//                 },
//                 child: const Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
