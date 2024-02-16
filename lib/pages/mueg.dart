

import 'dart:async';
import 'package:farmacofy/BBDD/bbdd.dart';
import 'package:farmacofy/BBDD/bbdd_medicamento_old.dart';
import 'package:farmacofy/inicioSesion/pantallaLogin.dart';
import 'package:farmacofy/pages/page_listado_usuarios.dart';
import 'package:farmacofy/pages/page_tratamiento.dart';
import 'package:farmacofy/presentacion/widgets/menu_drawer.dart';
import 'package:farmacofy/services/caida_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListadoTratamientos extends StatefulWidget {
  const ListadoTratamientos({Key? key}) : super(key: key);

  @override
  State<ListadoTratamientos> createState() => _ListadoTratamientosState();
}

class _ListadoTratamientosState extends State<ListadoTratamientos> {
  BaseDeDatos bdHelper = BaseDeDatos();

  Timer? _timer;
  bool? esAdmin;
  int? idTratamiento = null;
  String? fechaInicio = '';
  String? horaInicio = '';
  int? dosis=null;
  String? formattedDate;
  String? formattedTime;
  int? pastillasTratamiento;
  int? pastillasTratamientoAlarma;
  int? idMedicamento;
  String? nombreMedicamento;
  int? pastillaContador;

  bool prueba = false;



  void ejecutarOperaciones() async {
      

      if (fechaInicio == formattedDate && horaInicio == formattedTime) {
        
        mostrarNotificationConDosBotones(
            'Recordatorio', 'Es hora de tomar tu medicamento');

        int? pastillasTratamiento =
            await BaseDeDatos.obtenerCantidadTotalPastillas(idTratamiento!);

        pastillaContador=await BaseDeDatos.obtenerCantidadTotalPastillas(idTratamiento!);

        pastillasTratamiento = pastillasTratamiento! - dosis!;

        await BaseDeDatos.actualizarCantidadTotalPastillas(
            idTratamiento!, pastillasTratamiento);

        if (pastillasTratamiento <= pastillasTratamientoAlarma!) {
          int? idMedicamento =
              await BaseDeDatos.obtenerIdMedicamento(idTratamiento!);
          
          nombreMedicamento=await BaseDeDatos.obtenerNombreMedicamento(idMedicamento!);

          mostrarNotification('Recordatorio',
              'Debe reponer pastillas de: ${nombreMedicamento}');
        }
      }
    }

  @override
  void initState() {
    super.initState();
    _inicializarDatos(); // Llama a un método separado para inicializar los datos

    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      ejecutarOperaciones();
    });
  }

// Método para inicializar los datos de forma asíncrona
  void _inicializarDatos() async {
    esAdmin = context.read<AdminProvider>().esAdmin;
    DateTime now = DateTime.now();
    TimeOfDay time = TimeOfDay.now();
    formattedDate = DateFormat('yyyy/MM/dd').format(now);
    formattedTime =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

    try {
      idTratamiento = context.read<TratamientoAlarma>().idTratamiento!;
      fechaInicio = context.read<TratamientoAlarma>().fechaInitStr!;
      horaInicio = context.read<TratamientoAlarma>().horaInitStr!;
      dosis=context.read<TratamientoAlarma>().dosis!;
    } catch (e) {
      idTratamiento;
      fechaInicio;
      horaInicio;
      dosis;
    }

  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancelar el timer al salir de la pantalla
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // // Verificar si la fecha y hora coinciden con las del tratamiento y control de Stock
    ejecutarOperaciones();

    setState(
        () {}); // Actualizar la interfaz de usuario con el nuevo valor de prueba

    bool esAdmin = context.read<AdminProvider>().esAdmin;
    late int? usuario;
    if (esAdmin) {
      usuario = context.read<IdUsuarioSeleccionado>().idUsuario;
    } else {
      usuario = context.read<IdSupervisor>().idUsuario;
    }

    return GestureDetector(
        onTap: () {
          if (true)
            print(
                'Fecha de inicio: ${fechaInicio}, Hora de inicio: ${horaInicio}, Fecha Sistema: ${formattedDate}, Hora Sistema:${formattedTime}');
          setState(() {});
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tratamientos'),
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
                icon: const Icon(Icons.share),
              ),
            ],
          ),
          body: Stack(
            children: [
              FutureBuilder<List<Map<String, dynamic>>>(
                future:
                    BaseDeDatos.consultarTratamientosConMedicamentosPorUsuario(
                        usuario!),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Mientras espera la respuesta de la BD muestra un indicador de carga
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    if (snapshot.hasData) {
                      print('Número de registros: ${snapshot.data!.length}');
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            //Separacion entre las tarjetas
                            margin:
                                const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                    'https://www.stylist.co.uk/images/app/uploads/2022/06/01105352/jennifer-aniston-crop-1654077521-1390x1390.jpg?w=256&h=256&fit=max&auto=format%2Ccompress'),
                              ),
                              title: Text(
                                snapshot.data![index]['condicionMedica'] ??
                                    'Sin nombre del medicamento',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      'Dosis: ${snapshot.data![index]['dosis']}'),
                                  Text(
                                      'Fecha de inicio: ${snapshot.data![index]['fechaInicio']}'),
                                  Text(
                                      'Fecha de fin: ${snapshot.data![index]['fechaFin']}'),
                                  Text(
                                      'Frecuencia: ${snapshot.data![index]['frecuencia']}'),
                                  Text(
                                      'Via de administración: ${snapshot.data![index]['viaAdministracion']}'),
                                  Text(
                                      'Hora inicio toma: ${snapshot.data![index]['horaInicioToma']}'),
                                  Text(
                                      'Cantidad total envase : ${snapshot.data![index]['cantidadTotalPastillas']}'),
                                  Text(
                                      'Cantidad mínima envase : ${snapshot.data![index]['cantidadMinima']}'),

                                  Text(
                                      'Medicamento: ${snapshot.data![index]['nombreMedicamento']}'),
                                  // Acordarse de poner: m.nombre as nombreMedicamento
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                // Pregunta si está seguro de eliminar el tratamiento
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                            const Text('Eliminar Tratamiento'),
                                        content: const Text(
                                            '¿Estás seguro de eliminar el tratamiento?'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Cancelar'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('Aceptar'),
                                            onPressed: () {
                                              // Aquí va tu código para eliminar el medicamento de la base de datos
                                              BaseDeDatos.eliminarBD(
                                                  'Tratamiento',
                                                  snapshot.data![index]['id']);
                                              // BaseDeDatos.eliminarBD('Medicamento', snapshot.data![index]['idMedicamento']);
                                              setState(() {});
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              onTap: () {
                                // Acción al pulsar sobre la tarjeta nos lleva a la pantalla de edición
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PaginaTratamiento(),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('No hay tratamientos'));
                    }
                  }
                },
              ),
            ],
          ),
          drawer: MenuDrawer(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const PaginaTratamiento()),
              );
            },
            child: const Icon(Icons.add),
            backgroundColor: const Color(0xFF02A724),
          ),
        ));
  }
}
