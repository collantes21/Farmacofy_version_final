
import 'package:shared_preferences/shared_preferences.dart';

class Configuracion {

  static final Configuracion _instancia =  Configuracion._internal();

  factory Configuracion() {
    return _instancia;
  }

  Configuracion._internal();

  Future<String?> getParametro(String parametro) async {
    String? valor;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      valor = prefs.getString(parametro);
    } catch (e) {
      print('Error al obtener el parámetro $parametro: $e');

    }
    return valor;
  }

  Future<bool> setParametro(String parametro, String valor) async {
    bool resultado = false;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      resultado = await prefs.setString(parametro, valor);
    } catch (e) {
      print('Error al guardar el parámetro $parametro: $e');
    }
    return resultado;
  }
}