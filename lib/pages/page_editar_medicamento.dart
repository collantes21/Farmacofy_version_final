import 'package:farmacofy/BBDD/bbdd.dart';
import 'package:farmacofy/pages/page_listado_medicamentos.dart';
import 'package:farmacofy/models/medicamento.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 
 
class EditarMedicamento extends StatefulWidget {
  // Variable para almacenar el medicamento que se va a editar
  final Medicamento medicamentoEditar;
 
  const EditarMedicamento({super.key, required this.medicamentoEditar});
 
  @override
  State<EditarMedicamento> createState() => _EditarMedicamentoState();
}
 
class _EditarMedicamentoState extends State<EditarMedicamento> {
  Medicamento medicamento = Medicamento();
  BaseDeDatos bdHelper = BaseDeDatos();
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Editar medicamento'),
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
                  // Campo de texto para el nombre del medicamento
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    child: TextFormField(
                     
                      decoration:  InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        labelText: 'Nombre del medicamento',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                         prefixIcon: Icon(
                          FontAwesomeIcons.pills,
                          color: Colors.green
                        ),
                         border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color:
                                Colors.blue, // Esto cambia el color del borde
                            width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          medicamento.nombre = value;
                        });
                      },
                    ),
 
                    // Campo de texto para el prospecto del medicamento
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 18, 15),
                    child: TextFormField(
                      decoration:  InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        labelText: 'Prospecto del medicamento',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                         prefixIcon: Icon(
                          FontAwesomeIcons.filePrescription,
                          color: Colors.green
                        ),
                         border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color:
                                Colors.blue, // Esto cambia el color del borde
                            width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          medicamento.prospecto = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 18, 15),
                    child: TextFormField(
                      decoration:  InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        labelText: 'Fecha de caducidad',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                         prefixIcon: Icon(
                          FontAwesomeIcons.calendarAlt,
                          color: Colors.green
                        ),
                         border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color:
                                Colors.blue, // Esto cambia el color del borde
                            width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          medicamento.fechaCaducidad = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 18, 15),
                    child: TextFormField(
                      decoration:  InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        labelText: 'Tipo de envase',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                         prefixIcon: Icon(
                          FontAwesomeIcons.prescriptionBottleAlt,
                          color: Colors.green
                        ),
                         border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color:
                                Colors.blue, // Esto cambia el color del borde
                            width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          medicamento.tipoEnvase = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 18, 15),
                    child: TextFormField(
                      decoration:  InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[50],
                        labelText: 'Cantidad de envase',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                         prefixIcon: Icon(
                          FontAwesomeIcons.pumpMedical,
                          color: Colors.green
                        ),
                         border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color:
                                Colors.blue, // Esto cambia el color del borde
                            width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          medicamento.cantidadEnvase = int.parse(value);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 60, 18, 15),
                    child: ElevatedButton(
                      onPressed: () {
                        //  await db!.update(tabla, fila, where: 'id = ?', whereArgs: [fila['id']]);
                          /**
                           * ! Actualizar el medicamento en la base de datos
                           * * El id del medicamento se obtiene del medicamento que el usuarioa ha seleccionado en la lista medicamentos
                           * * Hemos guardado ese id seleccionado en la variable medicamentoEditar que se pasa como parámetro a esta página de edición
                           *
                           * * Ahora recuperamos ese id mediante el widget.medicamentoEditar.id y lo asignamos al medicamento que vamos a actualizar
                           */
                          medicamento.id = widget.medicamentoEditar.id;
                          BaseDeDatos.actualizarBD('Medicamento', medicamento.toMap());
                     
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
                                  builder: (context) => const   ListadoMedicamentos()),
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
 
