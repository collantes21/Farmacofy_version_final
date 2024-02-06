

import 'package:farmacofy/inicioSesion/pantallaLogin.dart';
import 'package:farmacofy/models/configuracion.dart';
import 'package:flutter/material.dart';

class ModoSupervisor extends ChangeNotifier {



  // bool _modoUsuario = false;
  // bool _modoSupervisor = false;

  // bool get modoUsuario => _modoUsuario;
  // bool get modoSupervisor => _modoSupervisor;

  // set modoUsuario(bool value) {
  //   _modoUsuario = value;
  //   _modoSupervisor = !value;

  //  if(value) {
  //   Configuracion().setParametro('modoAdmin', 'usuario');
  //  }else{
  //   Configuracion().setParametro('modoAdmin', 'supervisor');
  //  }
  //   notifyListeners();
  //  }
 
  // set modoSupervisor(bool value) {
  //   _modoSupervisor = value;
  //   _modoUsuario = !value;

  //   if(value) {
  //   Configuracion().setParametro('modoAdmin', 'supervisor');
  //   }else{
  //   Configuracion().setParametro('modoAdmin', 'usuario');
  //   }
  //   notifyListeners();
  // }

  // // Método que permite obtener el modo de trabajo

  // Future<void> obtenerModoSupervisor() async {
  //   String? modo = await Configuracion().getParametro('modoAdmin');
  //   if(modo == 'usuario') {
  //     _modoUsuario = true;
  //     _modoSupervisor = false;
  //   } else {
  //     _modoUsuario = false;
  //     _modoSupervisor = true;
  //   }
  //   notifyListeners();
  // }

  // // Método que permite cambiar el modo de trabajo

  // Future<void> cambiarModoSupervisor() async {
  //   if(_modoUsuario) {
  //     _modoUsuario = false;
  //     _modoSupervisor = true;
  //     await Configuracion().setParametro('modoAdmin', 'supervisor');
  //   } else {
  //     _modoUsuario = true;
  //     _modoSupervisor = false;
  //     await Configuracion().setParametro('modoAdmin', 'usuario');
  //   }
  //   notifyListeners();
  // }

  



}