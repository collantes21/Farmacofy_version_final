import 'package:farmacofy/BBDD/bbdd.dart';
import 'package:farmacofy/models/consulta_medica.dart';

class Usuario {
  int? _id;
  late String _nombre;
  late String _usuario;
  late String _contrasena;
  late bool _administrador;
   int? _idAdministrador;

  Usuario() {
    _nombre = "";
    _usuario = "";
    _contrasena = "";
    _administrador = false;
    _idAdministrador = 0;
  }

  Usuario.withData( {required String nombre, required String usuario, required String contrasena, required bool administrador, required int idAdministrador}) {
    _nombre = nombre;
    _usuario = usuario;
    _contrasena = contrasena;
    _administrador = administrador;
    _idAdministrador = idAdministrador;
  }

  Usuario.withId(int id, String nombre, String usuario, String contrasena,
      bool administrador, int idAdministrador) {
    _id = id;
    _nombre = nombre;
    _usuario = usuario;
    _contrasena = contrasena;
    _administrador = administrador;
    _idAdministrador = idAdministrador;
  }

  int? get id => _id;
  String get nombre => _nombre;
  String get usuario => _usuario;
  String get contrasena => _contrasena;
  bool get administrador => _administrador;
  int? get idAdministrador => _idAdministrador;

  set nombre(String nombre) {
    _nombre = nombre;
  }

  set usuario(String usuario) {
    _usuario = usuario;
  }

  set contrasena(String contrasena) {
    _contrasena = contrasena;
  }

  set administrador(bool administrador) {
    _administrador = administrador;
  }

  set idAdministrador(int? idAdministrador) {
    _idAdministrador = idAdministrador;
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null && _id != 0) {
      map['id'] = _id;
    }
    map['nombre'] = _nombre;
    map['usuario'] = _usuario;
    map['contrasena'] = _contrasena;
    map['administrador'] = _administrador ? 1 : 0;
    map['id_administrador'] = _idAdministrador;
    return map;
  }

  Usuario.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _nombre = map['nombre'];
    _usuario = map['usuario'];
    _contrasena = map['contrasena'];
    _administrador = map['administrador'] == 1;
    _idAdministrador = map['id_administrador'];
  }
}


   Future<List<Usuario>> obtenerModoAdmin(bool modoSupervisor) async {
    List<Usuario> listarUsuariosAdmin = [];

    if(modoSupervisor) {
      // Obtener las consultas de la base de datos local
      BaseDeDatos bd = BaseDeDatos();
      List<Map<String, dynamic>> consultas = await BaseDeDatos.consultarBD('Usuarios');
      for(int i = 0; i < consultas.length; i++) {
        listarUsuariosAdmin.add(Usuario.fromMapObject(consultas[i]));
      }

    } else {
      /**
       * ! IMPORTANTE!
       * * Obtener las consultas de la base de datos remota API
       * ? Aquí se haría la petición a la API para obtener las consultas
       * ? y se rellenaría el array de proximasConsultas con los datos obtenidos
       * * A continuación se muestra un posible ejemplo de cómo se haría la petición
       */

      // Ejemplo:
      // var response = await http.get('https://api.com/consultas');
      // if(response.statusCode == 200) {
      //   var consultas = json.decode(response.body);
      //   for(int i = 0; i < consultas.length; i++) {
      //     proximasConsultas.add(ConsultaMedica.fromMapObject(consultas[i]));
      //   }
      // }
      // return proximasConsultas;
      // En este caso, como no tenemos una API real, simplemente devolvemos un array vacío
      // para simular que no hay consultas
      return listarUsuariosAdmin; 

    }

    return listarUsuariosAdmin;
  }

  
