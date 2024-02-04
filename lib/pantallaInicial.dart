import 'package:farmacofy/almacen.dart';
import 'package:farmacofy/anadirTratamiento/tratamientos1.dart';
import 'package:farmacofy/config_menu/menu_items.dart';
import 'package:farmacofy/anadirTratamiento/tratamientos2.dart';
import 'package:farmacofy/instruccionesUsuario.dart';
import 'package:farmacofy/models/consulta_medica.dart';
import 'package:farmacofy/models/medicamentoOld.dart';
import 'package:farmacofy/modo/modo_trabajo.dart';
import 'package:farmacofy/pages/page_consulta_medica.dart';
import 'package:farmacofy/pages/page_medicamento.dart';
import 'package:farmacofy/pages/page_tratamiento.dart';
import 'package:farmacofy/presentacion/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PantallaInicial extends StatelessWidget {
  const PantallaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modoTrabajo = Provider.of<ModoTrabajo>(context);
    final consultaMedica = new ConsultaMedica();
    return Scaffold(
      appBar: AppBar(
                
        title: const Text('FarmacoFy'),
        backgroundColor: const Color(0xFF02A724),
        centerTitle: true,
       
       
        actions: [
          IconButton(
            onPressed: () {
              // Acción para el botón de configuración
            },
           icon: const Icon(Icons.settings),
          ),
          
        ],
        
      ),

      body: Column(
        children: [
           Expanded(
             child: FutureBuilder(
                    future: consultaMedica.obtenerProximasConsultas(modoTrabajo.modoLocal), 
                    builder: (context, AsyncSnapshot<List<ConsultaMedica>> snapshot) {
                      if(snapshot.hasData) {
                        return Column(
                          children:[
                             Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index){
                                return Card(
                                  margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                                  child: ListTile(
                                    title: Text(
                                      snapshot.data![index].especialista ,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Doctor: ${snapshot.data![index].doctor}'),
                                        Text('Fecha: ${snapshot.data![index].fecha}'),
                                        Text('Hora: ${snapshot.data![index].hora}'),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => PaginaConsultaMedica()),
                                      );
                                    },
                                  ),
                            
                                );
                            
                            
                                
                              },
                            ),
                          ),
                          ],
                        );
                      }
                      else {
                        return const Center(child: Text('No hay consultas'));
                      }
                    },
             ),
           
           ),
 
    
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: tratamientoMenuItems.length,
          //     itemBuilder: (context, index) {
          //       final tratamientoMenuItem = tratamientoMenuItems[index];
          //       return _CustomListTile(menuItem: tratamientoMenuItem);
          //     },
          //   ),
          // ),
        ],
      ),
      //
      drawer: MenuDrawer(), // Implementa el menú lateral
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            //Cambiar a pantalla de Formulario medicamento
           // MaterialPageRoute(builder: (context) => const Tratamientos1()),
           MaterialPageRoute(builder: (context) =>  const PaginaTratamiento()),
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
            icon: Icon(Icons.info_outline),
            label: 'Información',
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
                MaterialPageRoute(builder: (context) => const PantallaInicial()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const InstruccionesUsuario()),
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

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final TratamientoMenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title,
      style: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold
      ),
      ),
      subtitle: Row(
        children: [
          Text(
            "${menuItem.numPastillas}",
            style: const TextStyle(color: Color.fromARGB(255, 12, 100, 40),
            fontSize: 20.0,
            ),
          ),
          Text(
            " - ${menuItem.hora}",
            style: const TextStyle(color: Color.fromARGB(255, 12, 100, 40),
            fontSize: 20.0,
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, menuItem.link);
      },
    );
  }
}
