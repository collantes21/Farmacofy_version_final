import 'package:farmacofy/BBDD/bbdd.dart';
import 'package:farmacofy/models/usuario.dart';
import 'package:farmacofy/pages/page_listado_usuarios.dart';
import 'package:flutter/material.dart';
 
class EditarUsuario extends StatefulWidget {
  final Usuario usuarioSeleccionado;
  final Usuario usuarioNombre;
  final Usuario usuarioUsuario;
  final Usuario usuarioContrasena;
  final Usuario usuarioAdministrador;
  final Usuario usuarioIdAdministrador;
 
  const EditarUsuario(
      {super.key,
      required this.usuarioSeleccionado,
      required this.usuarioNombre,
      required this.usuarioUsuario,
      required this.usuarioContrasena,
      required this.usuarioAdministrador,
      required this.usuarioIdAdministrador});
 
  @override
  State<EditarUsuario> createState() => _EditarUsuarioState();
}
 
class _EditarUsuarioState extends State<EditarUsuario> {
  Usuario usuario = Usuario();
  BaseDeDatos bdHelper = BaseDeDatos();
 
  late TextEditingController nombreController;
  late TextEditingController usuarioController;
  late TextEditingController contrasenaController;
 
  @override
  void initState() {
    super.initState();
    nombreController = TextEditingController(text: widget.usuarioNombre.nombre);
    usuarioController = TextEditingController(text: widget.usuarioUsuario.usuario);
    contrasenaController = TextEditingController(text: widget.usuarioContrasena.contrasena);
  }
 
  @override
  void dispose() {
    nombreController.dispose();
    usuarioController.dispose();
    contrasenaController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Editar usuario'),
          backgroundColor: const Color(0xFF02A724),
          flexibleSpace: Container(
            //Sirve para definir el color de la barra de estado
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: nombreController,
                  onChanged: (value) {
                    usuario.nombre = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: usuarioController,
                  onChanged: (value) {
                    usuario.usuario = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Usuario',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: contrasenaController,
                  onChanged: (value) {
                    usuario.contrasena = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                     
                    usuario.id = widget.usuarioSeleccionado.id;
                    usuario.nombre = nombreController.text;
                    usuario.usuario = usuarioController.text;
                    usuario.contrasena = contrasenaController.text;
                    usuario.administrador = widget.usuarioAdministrador.administrador;
                    usuario.idAdministrador = widget.usuarioIdAdministrador.idAdministrador;
                    BaseDeDatos.actualizarBD('Usuarios', usuario.toMap());
 
                    //Mostrar mensaje de confirmación despues de 1 segundo
                    Future.delayed(const Duration(seconds: 2), () {
                      //Mostrar mensaje de confirmación
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Tratamiento modificado correctamente'),
                        ),
                      );
                      //Volver a la pagina de inicio
                      //Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListadoUsuarios()),
                      );
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // Esto hace que la fila tenga el tamaño del contenido
                    children: <Widget>[
                      Icon(Icons.save), // Aquí puedes cambiar el icono
                      SizedBox(width: 10), // Esto añade un espacio entre el icono y el texto
                      Text('Guardar cambios'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}