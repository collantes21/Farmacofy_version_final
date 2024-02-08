// ignore_for_file: prefer_const_constructors

import 'package:farmacofy/inicioSesion/pantallaLogin.dart';
import 'package:farmacofy/inicioSesion/pantallaRegistroLogin.dart';
import 'package:farmacofy/models/consulta_medica.dart';
import 'package:farmacofy/modo/modo_trabajo.dart';
import 'package:farmacofy/pages/page_configuracion.dart';
import 'package:farmacofy/pages/page_consulta_medica.dart';
import 'package:farmacofy/pages/page_listado_consultas.dart';
import 'package:farmacofy/pages/page_listado_medicamentos.dart';
import 'package:farmacofy/pages/page_listado_tratamientos.dart';
import 'package:farmacofy/pages/page_listado_usuarios.dart';
import 'package:farmacofy/pages/page_tratamiento.dart';
import 'package:farmacofy/pantallaInicial.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatefulWidget {
  
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {

  int indiceSeleccionado = 0;

  @override
  Widget build(BuildContext context) {

    final modoTrabajo = Provider.of<ModoTrabajo>(context);
    final esAdmin=Provider.of<AdminProvider>(context);
    
    return  NavigationDrawer(
      selectedIndex: indiceSeleccionado, // Permitirá cambiar el color del elemento seleccionado en el índice del menú
      // El método onDestinationSelected se ejecutará cuando se seleccione un elemento del menú lateral y se le pasará el índice del elemento seleccionado
      onDestinationSelected: (value) {
        //setState es un método que permite actualizar el estado de un widget
        setState(() {
          indiceSeleccionado = value; // Actualiza el índice seleccionado
        });

        // Navega a la ruta correspondiente al elemento seleccionado
        switch (value) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PantallaInicial()),
            ); 
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListadoMedicamentos()),
            ); 
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListadoTratamientos()),
            ); 
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListadoConsultasMedicas()),
            );
            break;
          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InicioPantalla()),
            );
            break;
          case 5:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InicioPantalla()),
            );
            break;
          case 6:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PaginaConfiguracion()),
            );
            break;
          case 7:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListadoUsuarios()),
            );
            break;
          default:
            Navigator.pushReplacementNamed(context, '/'); 
        }

      },
      children:  [

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
            // crear mas separacion del texto con el avatar
            SizedBox(width: 75),
          
            // Image(image: AssetImage('assets/farmacofy.jpg'),
            //   width: 60,
            //   height: 60, 
            //  ),
          
             CircleAvatar(

            radius: 25,
    
            backgroundImage: NetworkImage(
              
                'https://www.stylist.co.uk/images/app/uploads/2022/06/01105352/jennifer-aniston-crop-1654077521-1390x1390.jpg?w=256&h=256&fit=max&auto=format%2Ccompress'
                ),
          ),
 
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
           
            icon: Icon(Icons.medication_outlined), 
            label: Text('Medicamentos')
            ),
       
        NavigationDrawerDestination(
          icon: Icon(Icons.medication_liquid_outlined), 
          label: Text('Tratamiento')
          ),
        
        NavigationDrawerDestination(
          icon: Icon(Icons.medical_services_outlined), 
          label: Text('Consultas médicas')
          ),
          
        NavigationDrawerDestination(
          icon:  Icon(Icons.info_sharp), 
          label:  Text('Información')
        ),
         NavigationDrawerDestination(
          icon:  Icon(Icons.local_pharmacy_outlined), 
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
            Padding(
            padding: EdgeInsets.fromLTRB(28, 0, 28, 20),
            child: Divider(
              color: Colors.green,
              thickness: 2,
            ),
          ),
          NavigationDrawerDestination(
          icon:  Icon(Icons.settings), 
          label:  Text('Configuración')
        ),
        (esAdmin.esAdmin) ? NavigationDrawerDestination(
          icon:  Icon(Icons.admin_panel_settings), 
          label:  Text('Gestion de usuarios')
        ) : Text("")
          
        
      ],
    );
  }
}
