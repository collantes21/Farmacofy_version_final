
import 'package:farmacofy/models/configuracion.dart';
import 'package:flutter/material.dart';

class ModoTrabajo extends ChangeNotifier {
  
  bool _modoLocal = false;
  bool _modoRemoto = false;

  bool get modoLocal => _modoLocal;
  bool get modoRemoto => _modoRemoto;

  set modoLocal(bool value) {
    _modoLocal = value;
    _modoRemoto = !value;

   if(value) {
    Configuracion().setParametro('modoTrabajo', 'local');
   }else{
    Configuracion().setParametro('modoTrabajo', 'remoto');
   }
    notifyListeners();
   }
 
  set modoRemoto(bool value) {
    _modoRemoto = value;
    _modoLocal = !value;

    if(value) {
    Configuracion().setParametro('modoTrabajo', 'remoto');
    }else{
    Configuracion().setParametro('modoTrabajo', 'local');
    }
    notifyListeners();
  }

  // Método que permite obtener el modo de trabajo

  Future<void> obtenerModoTrabajo() async {
    String? modo = await Configuracion().getParametro('modoTrabajo');
    if(modo == 'local') {
      _modoLocal = true;
      _modoRemoto = false;
    } else {
      _modoLocal = false;
      _modoRemoto = true;
    }
    notifyListeners();
  }

  // Método que permite cambiar el modo de trabajo

  Future<void> cambiarModoTrabajo() async {
    if(_modoLocal) {
      _modoLocal = false;
      _modoRemoto = true;
      await Configuracion().setParametro('modoTrabajo', 'remoto');
    } else {
      _modoLocal = true;
      _modoRemoto = false;
      await Configuracion().setParametro('modoTrabajo', 'local');
    }
    notifyListeners();
  }

  



}