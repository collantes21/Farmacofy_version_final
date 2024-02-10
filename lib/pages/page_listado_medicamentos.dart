import 'package:farmacofy/BBDD/bbdd.dart';
import 'package:farmacofy/BBDD/bbdd_medicamento_old.dart';
import 'package:farmacofy/models/medicamento.dart';
import 'package:farmacofy/pages/page_editar_medicamento.dart';
import 'package:farmacofy/pages/page_medicamento.dart';
import 'package:farmacofy/pages/page_tratamiento.dart';
import 'package:farmacofy/presentacion/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListadoMedicamentos extends StatefulWidget {
 // final Medicamento medicamentoSeleccionado;

  const ListadoMedicamentos({super.key});

  @override
  State<ListadoMedicamentos> createState() => _ListadoMedicamentosState();
}

class _ListadoMedicamentosState extends State<ListadoMedicamentos> {
  BaseDeDatos bdHelper = BaseDeDatos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicamentos'),
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
            future: BaseDeDatos.consultarBD('Medicamento'),
            builder: (BuildContext context,
                AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Mientras espera la respuesta de la BD muestra un indicador de carga
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                if (snapshot.hasData) {
                  //  print('Número de registros: ${snapshot.data!.length}');
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        //Separacion entre las tarjetas
                        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                        child: Stack(
                          // Añade una imagen a la tarjeta
                          // Añade una imagen a la tarjeta
                          children: [
                            Positioned.fill(
                              child: Transform.scale(
                                scale: 1.0,
                                child: Opacity(
                                  opacity: 0.2,
                                  child: Image.asset(
                                    'assets/caja.jpeg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 8,
                              child: Container(
                                width: 40, // Ajusta a tu tamaño deseado
                                height: 40, // Ajusta a tu tamaño deseado
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/medicamento2.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                            FontAwesomeIcons.pills,
                            color: Colors.blue,
                            size: 40.0,
                          ),
                              title: Text(
                                snapshot.data![index]['nombre'] ??
                                    'Sin nombre del medicamento',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Prospecto: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${snapshot.data![index]['prospecto']}',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        const TextSpan(
                                          text: 'Fecha de caducidad: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 219, 9, 9),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${snapshot.data![index]['fechaCaducidad']}',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        const TextSpan(
                                          text: 'Tipo de envase: ',
                                          style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                237, 14, 92, 194),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${snapshot.data![index]['tipoEnvase']}',
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        const TextSpan(
                                          text: 'Cantidad: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Color.fromARGB(
                                                255, 201, 97, 183),
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${snapshot.data![index]['cantidadEnvase']}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                // Pregunta si está seguro de eliminar el medicamento
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                            'Eliminar ${snapshot.data![index]['nombre']}'),
                                        content: const Text(
                                            '¿Estás seguro de eliminar el medicamento?'),
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
                                                  'Medicamento',
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

                            /**
                             * ! IMPORTANTE!
                             * * Aqui implementamos el cambio de pantalla al pulsar sobre la tarjeta
                             * * nos dirije a la panta de modificar medicamento
                             */
                              onTap: () {
                                // Creamos un objeto de tipo Medicamento con los datos de la tarjeta seleccionada
                                Medicamento medicamentoSeleccionado = Medicamento();
                                medicamentoSeleccionado.id = snapshot.data![index]['id'];
                                // Acción al pulsar sobre la tarjeta nos lleva a la pantalla de edición
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      // Cambiar a pantalla EditarMedicamento y pasar el id del medicamento seleccionado
                                      builder: (context) =>  EditarMedicamento(medicamentoEditar: medicamentoSeleccionado)),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No hay medicamentos'));
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
            //Cambiar a pantalla de Formulario medicamento
            // MaterialPageRoute(builder: (context) => const Tratamientos1()),
            MaterialPageRoute(builder: (context) => const PaginaMedicamento()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFF02A724),
      ),
    );
  }
}
