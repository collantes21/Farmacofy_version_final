
import 'package:farmacofy/BBDD/bbdd_medicamento.dart';
import 'package:farmacofy/pages/page_consulta_medica.dart';
import 'package:flutter/material.dart';

class ListadoConsultasMedicas extends StatefulWidget {
  const ListadoConsultasMedicas({super.key});

  @override
  State<ListadoConsultasMedicas> createState() => _ListadoConsultasMedicasState();
}

class _ListadoConsultasMedicasState extends State<ListadoConsultasMedicas> {

  BDHelper bdHelper = BDHelper();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Consultas médicas'),
        backgroundColor: const Color(0xFF02A724),
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
         
            
              future: BDHelper().consultarBD('Consulta'), 
              builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) { // Mientras espera la respuesta de la BD muestra un indicador de carga
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        //Separacion entre las tarjetas
                        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                        child: ListTile(
                          title: Text(snapshot.data![index]['especialista'],
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
                          'Hora cita: '+ snapshot.data![index]['hora'], 
                          style: TextStyle(color: Color.fromARGB(255, 4, 167, 12), fontSize: 17.0),
                          ), // Añade la hora aquí
                      ],
                    ),
                    trailing: Text(
                      snapshot.data![index]['fecha'], 
                      style: TextStyle(color: Colors.teal, fontSize: 17.0),
                    ),
                  ),
                );
              },
            );
            
                }else{
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
           MaterialPageRoute(builder: (context) =>  const PaginaConsultaMedica()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFF02A724),
      ),
    );
  }
}