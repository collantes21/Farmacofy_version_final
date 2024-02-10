import 'package:farmacofy/BBDD/bbdd.dart';
import 'package:farmacofy/models/consulta_medica.dart';
import 'package:farmacofy/pages/page_listado_consultas.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditarConsultaMedica extends StatefulWidget {
  final ConsultaMedica consultaMedicaEditar;
  final ConsultaMedica consultaIdUsuario;

  const EditarConsultaMedica({super.key, required this.consultaMedicaEditar, required this.consultaIdUsuario});

  @override
  State<EditarConsultaMedica> createState() => _EditarConsultaMedicaState();
}

class _EditarConsultaMedicaState extends State<EditarConsultaMedica> {
  ConsultaMedica consultaMedica = ConsultaMedica();
  BaseDeDatos bdHelper = BaseDeDatos();
  FocusNode myFocusNode = FocusNode();
  
  // Esto permite que el campo de texto cambie de color cuando está seleccionado
  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() { // Cuando el campo de texto tiene el foco
      setState(() {}); // Esto hace que se redibuje el campo de texto
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Permite cerrar el teclado al tocar fuera de un campo de texto
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Editar consulta médica'),
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
          actions: [
            IconButton(
              onPressed: () {
                // Acción para el botón de configuración
              },
              icon: const Icon(Icons.mode_edit_outlined),
            ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    child: TextFormField(
                      focusNode: myFocusNode, // Declaramos el nodo de enfoque
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 217, 238, 218), 
                        labelText: 'Especialista',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(
                          FontAwesomeIcons.handHoldingMedical,
                          color: myFocusNode.hasFocus
                              ? Colors.green
                              : Colors.blueAccent,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(
                              15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color:
                                Colors.blue, // Esto cambia el color del borde
                            width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          consultaMedica.especialista = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: TextFormField(
                      //focusNode: myFocusNode,
                      decoration:  InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 217, 238, 218), 
                        
                        labelText: 'Doctor',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(FontAwesomeIcons.userDoctor,
                            color: myFocusNode.hasFocus
                              ? Colors.green
                              : Colors.blueAccent,
                            ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(
                              15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color:
                                Colors.blue, // Esto cambia el color del borde
                            width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          consultaMedica.doctor = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: TextFormField(
                      //focusNode: myFocusNode,
                      decoration:  InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 217, 238, 218), 
                        labelText: 'Fecha',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(FontAwesomeIcons.calendarPlus,
                             color: myFocusNode.hasFocus
                              ? Colors.green
                              : Colors.blueAccent,
                            ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(
                              15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color:
                                Colors.blue, // Esto cambia el color del borde
                            width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          consultaMedica.fecha = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: TextFormField(
                      //focusNode: myFocusNode,
                      decoration:  InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 217, 238, 218), 
                        labelText: 'Hora',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(FontAwesomeIcons.clock,
                             color: myFocusNode.hasFocus
                              ? Colors.green
                              : Colors.blueAccent,
                            ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(
                              15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color:
                                Colors.blue, // Esto cambia el color del borde
                            width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          consultaMedica.hora = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: TextFormField(
                      //focusNode: myFocusNode,
                      decoration:  InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 217, 238, 218), 
                        labelText: 'Motivo',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(FontAwesomeIcons.bookMedical,
                             color: myFocusNode.hasFocus
                              ? Colors.green
                              : Colors.blueAccent,
                            ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(
                              15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color: Colors
                                .greenAccent, // Esto cambia el color del borde
                            width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          consultaMedica.motivo = value;
                        });
                      },
                    ),
                  ),

                  // Recoger idUsuario del usuario logueado


                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: ElevatedButton(
                      onPressed: () {
                        consultaMedica.idUsuario = widget.consultaIdUsuario.idUsuario; 
                        consultaMedica.id = widget.consultaMedicaEditar.id;
                        BaseDeDatos.actualizarBD('Consulta', consultaMedica.toMap());

                          //Mostrar mensaje de confirmación despues de 1 segundo
                          Future.delayed(const Duration(seconds: 2), () {
                            //Mostrar mensaje de confirmación
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Medicamento modificado correctamente'),
                              ),
                            );
                            //Volver a la pagina de inicio
                            //Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListadoConsultasMedicas()),
                            );
                          }
                        );

                      }, 
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // Esto hace que la fila tenga el tamaño del contenido
                        children: <Widget>[
                          Icon(Icons.save), // Aquí puedes cambiar el icono
                          SizedBox(width: 10), // Esto añade un espacio entre el icono y el texto
                          Text('Guardar cambios'),
                        ],
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.green)))), 
                      ),
                    ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
