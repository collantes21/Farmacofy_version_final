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
  const MenuDrawer({Key? key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  int indiceSeleccionado = 0;

  @override
  Widget build(BuildContext context) {
    final modoTrabajo = Provider.of<ModoTrabajo>(context);
    final esAdmin = Provider.of<AdminProvider>(context);

    return NavigationDrawer(
      selectedIndex: indiceSeleccionado,
      onDestinationSelected: (value) {
        setState(() {
          indiceSeleccionado = value;
        });

   

            switch (value) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ListadoTratamientos()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const ListadoMedicamentos()),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const ListadoTratamientos()),
            );
            break;
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const ListadoConsultasMedicas()),
            );
            break;
          case 4:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const InicioPantalla()),
            );
            break;
          case 5:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const InicioPantalla()),
            );
            break;
          case 6:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PaginaConfiguracion(),
              ),
            );
            break;
            
          case 7:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ListadoUsuarios()),
            );
            break;
        }
        

        
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, 30, 16, 10),
          child: Row(
            children: <Widget>[
              Text(
                'FarmacoFy',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                ),
              ),
              SizedBox(width: 75),
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    'https://www.stylist.co.uk/images/app/uploads/2022/06/01105352/jennifer-aniston-crop-1654077521-1390x1390.jpg?w=256&h=256&fit=max&auto=format%2Ccompress'),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 0, 28, 20),
          child: Divider(
            color: Colors.green,
            thickness: 2,
          ),
        ),

        const NavigationDrawerDestination(
            icon: Icon(Icons.home), label: Text('Inicio')),
            // Hacemos desaparecer el boton de inicio si el usuario es admin
            //(!esAdmin.esAdmin)? 
        const NavigationDrawerDestination(
            icon: Icon(Icons.medication_outlined), label: Text('Medicamentos')),
            //: SizedBox.shrink(), // Si es admin, no se muestra el boton
            
        const NavigationDrawerDestination(
            icon: Icon(Icons.medication_liquid_outlined),
            label: Text('Tratamiento')),
            //: SizedBox.shrink(),
           
        const NavigationDrawerDestination(
            icon: Icon(Icons.medical_services_outlined),
            label: Text('Consultas médicas')),
        
        const NavigationDrawerDestination(
            icon: Icon(Icons.assignment_return_outlined),
            label: Text('Cerrar sesion')),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 28, 20),
          child: Divider(
            color: Colors.green,
            thickness: 2,
          ),
        ),
       const Padding(
            padding: EdgeInsets.fromLTRB(28, 0, 16, 10),
            child: Text(
              'Configuración',
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 24,
              ),
            )),
       const Padding(
          padding: EdgeInsets.fromLTRB(28, 0, 28, 20),
          child: Divider(
            color: Colors.green,
            thickness: 2,
          ),
        ),
        const NavigationDrawerDestination(
            icon: Icon(Icons.info_sharp), label: Text('Gestionar Perfil')),
        NavigationDrawerDestination(
            icon: Icon(Icons.settings), label: Text('Configuración')),
        (esAdmin.esAdmin)
            ? NavigationDrawerDestination(
                icon: Icon(Icons.admin_panel_settings),
                label: Text('Gestion de usuarios'))
            : Text("")
      ],
    );
  }
}
