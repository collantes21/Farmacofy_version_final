

// ignore_for_file: prefer_const_constructors

import 'package:farmacofy/pantallaInicial.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {

  int indiceSeleccionado = 0;

  @override
  Widget build(BuildContext context) {
    return  NavigationDrawer(
      selectedIndex: indiceSeleccionado, // Permitirá cambiar el color del elemento seleccionado en el indice del menú
      // El método onDestinationSelected se ejecutará cuando se seleccione un elemento del menú lateral y se le pasará el indice del elemento seleccionado
      onDestinationSelected: (value) {
        //setState es un método que permite actualizar el estado de un widget
        setState(() {
          indiceSeleccionado = value; // Actualiza el indice seleccionado
        });

        // Navega a la ruta correspondiente al elemento seleccionado
        switch (value) {
          case 0:
          // Aqui se puede navegar a la ruta de dos formas diferentes
          // 1. Usando el método Navigator.push que recibe un MaterialPageRoute que es una ruta que se construye a partir de un widget
          // 2. Usando el método Navigator.pushNamed que recibe el nombre de la ruta definida en el atributo routes del MaterialApp
          // La diferencia entre ambas es que la primera permite pasar argumentos a la ruta y la segunda no
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PantallaInicial()),
              ); // Navega a la ruta '/'
            break;
          case 1:
            Navigator.pushNamed(context, '/intruccionesUsuario'); 
            break;
          case 2:
            Navigator.pushNamed(context, '/compraFarmacia'); 
            break;
          default:
            Navigator.pushReplacementNamed(context, '/'); 
        }

      },
      children: const [

         Padding(
          padding:  EdgeInsets.fromLTRB(28, 30, 16, 10), // EdgeInsets.fromLTRB(left, top, right, bottom)  sirve para definir el padding de un widget, muy útil para definir el espacio entre elementos
         // Esto es un intento de crear un logo para la aplicación pero no funciona ??? Problema con los assets
          child:  Row(
          children: <Widget>[
            Text(
              'FarmacoFy',
              style: TextStyle(
                color: Colors.green,
                fontSize: 24,
              ),
            ),
            Image(image: AssetImage('C:/Users/USER/Documents/DI/Proyecto AppFarmacos/FARMACOFY_BUENO/farmacofy-1/lib/images/farmacofy.jpg'),
              width: 60,
              height: 60, 
             )
              // Asegúrate de que la imagen esté en la carpeta de assets de tu proyecto
          
          ],
        ),
          ),

            Padding(
            padding: EdgeInsets.fromLTRB(28, 0, 28, 20),
            child: Divider(
              color: Colors.green,
              thickness: 2,
            ),
          ),

        // Cada elemento del menú lateral es un NavigationDrawerDestination
        NavigationDrawerDestination(
          icon:  Icon(Icons.home), 
          label:  Text('Inicio')
        ),
         NavigationDrawerDestination(
          icon:  Icon(Icons.info_outline), 
          label:  Text('Información')
        ),
         NavigationDrawerDestination(
          icon:  Icon(Icons.local_pharmacy_rounded), 
          label:  Text('Farmacias')
        ),
         Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 28, 20),
            child: Divider(
              color: Colors.green,
              thickness: 2,
            ),
          ),
           Padding(
          padding:  EdgeInsets.fromLTRB(28, 0, 16, 10), // EdgeInsets.fromLTRB(left, top, right, bottom)  sirve para definir el padding de un widget, muy útil para definir el espacio entre elementos
          child: Text(
            'Configuración',
            style: TextStyle(
              
              color: Colors.lightBlue,
              fontSize: 24,
              //fontWeight: FontWeight.bold,
            ),
          )
          ),
        
      ],
    );
  }
}