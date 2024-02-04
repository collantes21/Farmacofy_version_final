

import 'package:farmacofy/modo/modo_trabajo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaginaConfiguracion extends StatefulWidget {
  const PaginaConfiguracion({super.key});

  @override
  State<PaginaConfiguracion> createState() => _PaginaConfiguracionState();
}

class _PaginaConfiguracionState extends State<PaginaConfiguracion> {
  
  @override
  Widget build(BuildContext context) {

    final modoTrabajo = Provider.of<ModoTrabajo>(context);
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        backgroundColor: const Color(0xFF02A724),
        centerTitle: true,
      ),

      body: Center(
        child: ListView(
          children: [
           const ListTile(
            title:  Text(
              "Ajustes generales",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SwitchListTile(
            title: const Text(
              "Funcionamiento local",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
              value: modoTrabajo.modoLocal,
              onChanged: (value) {
                modoTrabajo.modoLocal = value;
              },

          ),
          ],
          
        ),
      ),
    );
  }
}

