import 'package:farmacofy/almacen.dart';
import 'package:farmacofy/config_menu/menu_items.dart';
import 'package:farmacofy/anadirTratamiento/tratamientos2.dart';
import 'package:farmacofy/pantallaInicial.dart';
import 'package:farmacofy/presentacion/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

class InstruccionesUsuario extends StatelessWidget {
  const InstruccionesUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmacoFy'),
        backgroundColor: const Color(0xFF02A724),
        flexibleSpace: Container( //Sirve para definir el color de la barra de estado
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
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Stack(
        children:[ Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(38.0),
              child: Text(
                'Instrucciones de uso',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: instruccionesUsoMenuItem.length,
                itemBuilder: (context, index) {
                  final instruccionIbuprofenoMenuItems = instruccionesUsoMenuItem[index];
                  return _CustomListTile(menuItem: instruccionIbuprofenoMenuItems);
                },
              ),
            ),
          ],
        ),
        
        Positioned(
          top: 50.0,
          right:20.0,
          child: Column(
            children: [
              IconButton(
                iconSize:  40.0,
                icon: Icon(Icons.add_a_photo_rounded),
                onPressed: (){

                },
                
              ),
              Text('Agregar foto')
            ],
          ),
          )
        ]
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

  final InstruccionesUsoMenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: menuItem.color),
      
      trailing: menuItem.title == 'Cantidad restante: ' ? Icon(Icons.arrow_forward_ios_rounded, color: colors.primary) : null,
      title:  Text(
        menuItem.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17.0,),
      ),

      
      
      subtitle: Row(
        children: [
          Text(menuItem.subtitle),
          const SizedBox(
            width: 5,
          ),
          Text(
            menuItem.numPastillas,
            style: const TextStyle(color: Colors.red),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          ),
          
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, menuItem.link);
      },
      
    );
  }
}
