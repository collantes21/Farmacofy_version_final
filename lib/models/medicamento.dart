

class Medicamento {

  int? _id;
  late String _nombre;
  late String _prospecto;
  late String _fechaCaducidad;
  late String _tipoEnvase;
  late int _cantidadEnvase;

  Medicamento(){
    _nombre = "";
    _prospecto = "";
    _fechaCaducidad = "";
    _tipoEnvase = "";
    _cantidadEnvase = 0;
  }

    // Getters y setters

  int? get id => _id;
  String get nombre => _nombre;
  String get prospecto => _prospecto;
  String get fechaCaducidad => _fechaCaducidad;
  String get tipoEnvase => _tipoEnvase;
  int get cantidadEnvase => _cantidadEnvase;

  set nombre(String nombre) {
    _nombre = nombre;
  }

  set prospecto(String prospecto) {
    _prospecto = prospecto;
  }

  set fechaCaducidad(String fechaCaducidad) {
    _fechaCaducidad = fechaCaducidad;
  }

  set tipoEnvase(String tipoEnvase) {
    _tipoEnvase = tipoEnvase;
  }

  set cantidadEnvase(int cantidadEnvase) {
    _cantidadEnvase = cantidadEnvase;
  }
  

  // Convertir un objeto de tipo Medicamento a un objeto de tipo Map
  // Esto es útil cuando necesitas guardar un objeto Medicamento en una base de datos o enviarlo a una API

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    if(id != null && id != 0){
      map['id'] = _id;
    }
    map['nombre'] = _nombre;
    map['prospecto'] = _prospecto;
    map['fechaCaducidad'] = _fechaCaducidad;
    map['tipoEnvase'] = _tipoEnvase;
    map['cantidadEnvase'] = _cantidadEnvase;
    return map;
  }

  // Convertir un objeto de tipo Map a un objeto de tipo Medicamento
  // Esto es útil cuando obtienes datos de una base de datos o una API que devuelve los datos en formato Map

  Medicamento.fromMap(dynamic obj) {
    _id = obj['id'];
    _nombre = obj['nombre'];
    _prospecto = obj['prospecto'];
    _fechaCaducidad = obj['fechaCaducidad'];
    _tipoEnvase = obj['tipoEnvase'];
    _cantidadEnvase = obj['cantidadEnvase'];
  }



}