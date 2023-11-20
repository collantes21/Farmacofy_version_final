import 'package:flutter/material.dart';

class tratamientos1 extends StatelessWidget {
  const tratamientos1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FarmacoFy'),
        backgroundColor: Color(0xFF02A724),
        actions: [
          IconButton(
            onPressed: () {
              // final destino=MaterialPageRoute(
              //   // builder: (_)=>PaginaAjustes());
              //   Navigator.push(context, destino);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar medicamento...',
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navegar a la página del medicamento seleccionado
                    // final destino = MaterialPageRoute(
                    //   builder: (_) => DetalleMedicamento('Medicamento 1'),
                    // );
                    // Navigator.push(context, destino);
                  },
                  child: ListTile(),
                ),
                // Aquí puedes agregar elementos a la lista
                ListTile(
                  title: Text('Medicamento 1'),
                ),
                ListTile(
                  title: Text('Medicamento 2'),
                ),
                ListTile(
                  title: Text('Medicamento 3'),
                ),
                // ... más elementos de la lista
              ],
            ),
          ),
        ],
      ),
    );
  }
}
