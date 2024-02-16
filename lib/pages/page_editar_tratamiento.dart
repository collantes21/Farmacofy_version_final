import 'package:farmacofy/BBDD/bbdd.dart';
import 'package:farmacofy/models/tratamiento.dart';
import 'package:farmacofy/pages/page_listado_tratamientos.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
 
class EditarTratamiento extends StatefulWidget {
  final Tratamiento tratamientoCondicionMedica;
  final Tratamiento tratamientoDosis;
  final Tratamiento tratamientoFrecuencia;
  final Tratamiento tratamientoViaAdministracion;
  final Tratamiento tratamientoFechaInicio;
  final Tratamiento tratamientoFechaFin;
  final Tratamiento tratamientoHoraInicioToma;
  final Tratamiento tratamientoCantidadTotalPastillas;
  final Tratamiento tratamientoCantidadMinima;
  final Tratamiento tratamientoDescripcion;
  // final Tratamiento tratamientoRecordatorio;
  final Tratamiento tratamientoEditar;
  final Tratamiento tratamientoIdMedicamento;
  final Tratamiento tratamientoIdUsuario;
  // final Tratamiento tratamiento;
 
 
  const EditarTratamiento({super.key, required this.tratamientoEditar, required this.tratamientoIdMedicamento, required this.tratamientoIdUsuario,  required this.tratamientoCondicionMedica, required this.tratamientoDosis, required this.tratamientoFrecuencia, required this.tratamientoViaAdministracion, required this.tratamientoFechaFin, required this.tratamientoDescripcion, required this.tratamientoHoraInicioToma, required this.tratamientoCantidadTotalPastillas, required this.tratamientoCantidadMinima, required this.tratamientoFechaInicio,   });
 
  @override
  State<EditarTratamiento> createState() => _EditarTratamientoState();
}
 
class _EditarTratamientoState extends State<EditarTratamiento> {
 
  Tratamiento tratamiento = Tratamiento();
  BaseDeDatos bdHelper = BaseDeDatos();
 
 
  late TextEditingController condicionMedicaController;
  late TextEditingController dosisController;
  late TextEditingController frecuenciaController;
  late TextEditingController viaAdministracionController;
  late TextEditingController fechaInicioController;
  late TextEditingController fechaFinController;
  late TextEditingController horaInicioTomaController;
  late TextEditingController cantidadTotalPastillasController;
  late TextEditingController cantidadMinimaController;
  late TextEditingController descripcionController;
  late TextEditingController recordatorioController;
 
  @override
  void initState() {
    super.initState();
    condicionMedicaController = TextEditingController(text: widget.tratamientoCondicionMedica.condicionMedica);
    dosisController = TextEditingController(text: widget.tratamientoDosis.dosis.toString());
    frecuenciaController = TextEditingController(text: widget.tratamientoFrecuencia.frecuencia.toString());
    viaAdministracionController = TextEditingController(text: widget.tratamientoViaAdministracion.viaAdministracion);
       fechaInicioController = TextEditingController(text: widget.tratamientoFechaInicio.fechaInicio.toString());
    fechaFinController = TextEditingController(text: widget.tratamientoFechaFin.fechaFin.toString());
    horaInicioTomaController = TextEditingController(text: widget.tratamientoHoraInicioToma.horaInicioToma.toString());
    cantidadTotalPastillasController = TextEditingController(text: widget.tratamientoCantidadTotalPastillas.cantidadTotalPastillas.toString());
    cantidadMinimaController = TextEditingController(text: widget.tratamientoCantidadMinima.cantidadMinima.toString());
    descripcionController = TextEditingController(text: widget.tratamientoDescripcion.descripcion);
    // recordatorioController = TextEditingController(text: widget.tratamientoRecordatorio.recordatorio.toString());
   
  }
 
  @override
  void dispose() {
    condicionMedicaController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
   
    return  GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode()); // Esto es para cerrar el teclado cuando tocas fuera de un campo de texto
      },
      child: Scaffold(
         appBar: AppBar(
          title: const Text('Actualizar tratamiento'),
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
          children: <Widget> [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: TextFormField(
               
                controller: condicionMedicaController,
                decoration: InputDecoration(
                  fillColor: Colors.blue[50],
                        labelText: 'Condición médica',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(FontAwesomeIcons.bookMedical, color: Colors.green,),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color: Colors.blue, width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                ),
                onChanged: (value) {
                  setState(() {
                    tratamiento.condicionMedica = value;
                   
                  });
                },
                // onSaved: (value){
                //   tratamiento.condicionMedica = value.toString();
                // },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: TextFormField(
                controller: dosisController,
                decoration: InputDecoration(
                  fillColor: Colors.blue[50],
                        labelText: 'Dosis',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(FontAwesomeIcons.pumpMedical, color: Colors.green,),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color: Colors.blue, width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                ),
                onChanged: (value) {
                  setState(() {
                    if ( value is String && esNumero(value)) {
                    tratamiento.dosis = int.parse(value);
                    } else {
                      print('El valor ingresado no es un número');
                      // Aquí puedes manejar el error como prefieras.
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: TextFormField(
                controller: frecuenciaController,
                decoration: InputDecoration(
                  fillColor: Colors.blue[50],
                        labelText: 'Frecuencia',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(FontAwesomeIcons.userClock, color: Colors.green,),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color: Colors.blue, width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                ),
                onChanged: (value) {
                  setState(() {
                    if ( value is String && esNumero(value)) {
                    tratamiento.frecuencia = int.parse(value);
                    } else {
                      print('El valor ingresado no es un número');
                      // Aquí puedes manejar el error como prefieras.
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: TextFormField(
                controller: viaAdministracionController,
                decoration: InputDecoration(
                  fillColor: Colors.blue[50],
                        labelText: 'Vía de administración',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(FontAwesomeIcons.kitMedical, color: Colors.green,),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color: Colors.blue, width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                ),
                onChanged: (value) {
                  setState(() {
                    tratamiento.viaAdministracion = value;
                  });
                },
              ),
            ),
 
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: TextFormField(
                 controller: fechaInicioController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  fillColor: Colors.blue[50],
                        labelText: 'Fecha de inicio',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(FontAwesomeIcons.calendarDay, color: Colors.green,),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color: Colors.blue, width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                ),
                onChanged: (value) {
                  setState(() {
                   
                      tratamiento.fechaInicio = value;
                   
                    // String fechaInicio = value;
                    // DateFormat format = DateFormat("dd/MM/yyyy");
                    // DateTime fecha = format.parse(fechaInicio);
                   
                  });
                },
              ),
            ),
 
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: TextFormField(
                controller: fechaFinController,
                decoration: InputDecoration(
                  fillColor: Colors.blue[50],
                        labelText: 'Fecha de fin',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(FontAwesomeIcons.calendar, color: Colors.green,),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color: Colors.blue, width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                ),
                onChanged: (value) {
                  setState(() {
                    tratamiento.fechaFin = value;
                  });
                },
              ),
            ),
 
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: TextFormField(
                controller: horaInicioTomaController,
                decoration: InputDecoration(
                  fillColor: Colors.blue[50],
                        labelText: 'Hora de inicio de toma',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(FontAwesomeIcons.clock, color: Colors.green,),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color: Colors.blue, width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                ),
                onChanged: (value) {
                  setState(() {
                    tratamiento.horaInicioToma = value;
                  });
                },
              ),
            ),
 
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: TextFormField(
                controller: cantidadTotalPastillasController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.blue[50],
                        labelText: 'Cantidad total de pastillas',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(FontAwesomeIcons.pills, color: Colors.green,),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color: Colors.blue, width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                ),
                onChanged: (value) {
                  setState(() {
                    if ( value is String && esNumero(value)) {
                      tratamiento.cantidadTotalPastillas = int.parse(value);
                    } else {
                      print('El valor ingresado no es un número');
                      // Aquí puedes manejar el error como prefieras.
                    }
                  });
                },
              ),
            ),
 
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: TextFormField(
                controller: cantidadMinimaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.blue[50],
                        labelText: 'Cantidad mínima de pastillas',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(FontAwesomeIcons.batteryQuarter, color: Colors.green,),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color: Colors.blue, width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                ),
                onChanged: (value) {
                  setState(() {
                    if (  value is String && esNumero(value)) {
                      tratamiento.cantidadMinima = int.parse(value);
                    } else {
                      print('El valor ingresado no es un número');
                      // Aquí puedes manejar el error como prefieras.
                    }
                   
                  });
                },
              ),
            ),
 
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: TextFormField(
                controller: descripcionController,
                decoration: InputDecoration(
                  fillColor: Colors.blue[50],
                        labelText: 'Descripción',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        prefixIcon: Icon(FontAwesomeIcons.notesMedical, color: Colors.green,),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)), // Esto hace que el borde sea redondeado
                          borderSide: BorderSide(
                            color: Colors.blue, width: 2, // Esto cambia el ancho del borde
                          ),
                        ),
                ),
                onChanged: (value) {
                  setState(() {
                    tratamiento.descripcion = value;
                  });
                },
              ),
            ),
 
 
            Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: ElevatedButton(
                      onPressed: () {
                        //Guardar tratamiento en la base de datos
                        tratamiento.condicionMedica = condicionMedicaController.text;
                        tratamiento.dosis = int.parse(dosisController.text);
                        tratamiento.frecuencia = int.parse(frecuenciaController.text);
                        tratamiento.viaAdministracion = viaAdministracionController.text;
                        tratamiento.fechaInicio = fechaInicioController.text;
                        tratamiento.fechaFin = fechaFinController.text;
                        tratamiento.horaInicioToma = horaInicioTomaController.text;
                        tratamiento.cantidadTotalPastillas = int.parse(cantidadTotalPastillasController.text);
                        tratamiento.cantidadMinima = int.parse(cantidadMinimaController.text);
                        tratamiento.descripcion = descripcionController.text;
 
                        tratamiento.idUsuario = widget.tratamientoIdUsuario.idUsuario;
                        tratamiento.id = widget.tratamientoEditar.id;
                        tratamiento.idMedicamento = widget.tratamientoIdMedicamento.idMedicamento;
                        BaseDeDatos.actualizarBD('Tratamiento', tratamiento.toMap());
 
                          //Mostrar mensaje de confirmación despues de 1 segundo
                          Future.delayed(const Duration(seconds: 2), () {
                            //Mostrar mensaje de confirmación
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Tratamiento modificado correctamente'),
                              ),
                            );
                            //Volver a la pagina de inicio
                            //Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListadoTratamientos()),
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
 
  /**
   * * Método para comprobar si un String es un número
   * * Asi podremos modificar los campos que sean de tipo numérico en tratamiento
   *  */
 
        bool esNumero(String s) {
     
        return int.tryParse(s) != null;
      }
}