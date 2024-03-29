import 'package:farmacofy/BBDD/bbdd.dart';
import 'package:farmacofy/BBDD/bbdd_medicamento_old.dart';
import 'package:farmacofy/almacen.dart';
import 'package:farmacofy/inicioSesion/pantallaLogin.dart';
import 'package:farmacofy/models/consulta_medica.dart';
import 'package:farmacofy/pages/page_consulta_medica.dart';
import 'package:farmacofy/pages/page_editar_consulta.dart';
import 'package:farmacofy/pages/page_listado_tratamientos.dart';
import 'package:farmacofy/pages/page_listado_usuarios.dart';
import 'package:farmacofy/pages/page_medicamento.dart';
import 'package:farmacofy/presentacion/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
 
class ListadoConsultasMedicas extends StatefulWidget {
  const ListadoConsultasMedicas({super.key});
 
  @override
  State<ListadoConsultasMedicas> createState() =>
      _ListadoConsultasMedicasState();
}
 
class _ListadoConsultasMedicasState extends State<ListadoConsultasMedicas> {
  BaseDeDatos bdHelper = BaseDeDatos();
 
  @override
  Widget build(BuildContext context) {
 
    bool esAdmin = context.read<AdminProvider>().esAdmin;
 
    late int usuario;
 
    if(esAdmin){
      // Si es admin , recogemos el id del usuario seleccionado que esta siendo supervisado
      usuario = context.read<IdUsuarioSeleccionado>().idUsuario;
    } else {
      // Si no es admin, recogemos el id del usuario logeado normal
      usuario = context.read<IdSupervisor>().idUsuario;
    }
 
 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas médicas'),
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
      drawer: MenuDrawer(),
      body: Stack(
        children: [
          FutureBuilder<List<Map<String, dynamic>>>(
            // Llamamos al método que nos devuelve las consultas médicas del usuario seleccionado
            future: BaseDeDatos.consultarConsultasPorUsuario(usuario),
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Mientras espera la respuesta de la BD muestra un indicador de carga
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        //Separacion entre las tarjetas
                        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                        child: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.userMd,
                            color: Colors.blue,
                            size: 40.0,
                          ),
                          title: Text(
                            snapshot.data![index]['especialista'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                snapshot.data![index]['doctor'],
                                style: TextStyle(
                                    color: Color.fromARGB(255, 12, 42, 173),
                                    fontSize: 15.0),
                              ),
                              Text(
                                'Hora: ' + snapshot.data![index]['hora'],
                                style: TextStyle(
                                    color: Color.fromARGB(255, 4, 167, 12),
                                    fontSize: 17.0),
                              ),
                              Text(
                            'Fecha cita: '+snapshot.data![index]['fecha'],
                            style:
                                TextStyle(color: Colors.teal, fontSize: 17.0),
                          ), // Añade la hora aquí
                            ],
                          ),
                          trailing:
 
                            IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                             // Pregunta si está seguro de eliminar la consulta
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Eliminar la consulta médica'),
                                    content:  Text(
                                        '¿Estás seguro de eliminar la consulta de: ${snapshot.data![index]['especialista']} ?'),
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
                                          // Aquí va tu código para eliminar la consulta de la base de datos
                                          BaseDeDatos.eliminarBD('Consulta', snapshot.data![index]['id']);
                                         
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
 
                          /**
                           * ! IMPORTANTE
                           * * Aqui se implementa el cambio de pantalla al pulsar sobre una tarjeta consulta
                           * * Se pasa como parametro la consulta seleccionada
                           */
 
                          onTap: (){
                            ConsultaMedica consultaSeleccionada = ConsultaMedica();
                            consultaSeleccionada.id = snapshot.data![index]['id'];
                            ConsultaMedica consultaIdUsuario = ConsultaMedica();
                            consultaIdUsuario.idUsuario = snapshot.data![index]['idUsuario'];
 
                            Navigator.push(
                              context,
                              MaterialPageRoute(
 
                               
                                builder: (context) => EditarConsultaMedica(consultaMedicaEditar: consultaSeleccionada, consultaIdUsuario: consultaIdUsuario,),
                              ),
                            );
                          },
 
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            //Cambiar a pantalla de Formulario medicamento
            // MaterialPageRoute(builder: (context) => const Tratamientos1()),
            MaterialPageRoute(
                builder: (context) => const PaginaConsultaMedica()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFF02A724),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication_liquid),
            label: '+ Medicamento',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy_rounded),
            label: 'Farmacias',
          ),
        ],
        onTap: (index) {
          // Lógica para manejar la selección de ítem
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ListadoTratamientos()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const PaginaMedicamento()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Almacen()),
              );
              break;
          }
        },
      ),
    );
  }
}