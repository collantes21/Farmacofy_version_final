
class ConsultaMedica {
  int? _id;
  late String _especialista;
  late String _doctor;
  late String _fecha;
  late String _hora;
  late String _motivo;
  

  ConsultaMedica(){
    _especialista = "";
    _doctor = "";
    _fecha = "";
    _hora = "";
    _motivo = "";
  }

  ConsultaMedica.withData(String especialista, String doctor, String fecha, String hora, String motivo){
    _especialista = especialista;
    _doctor = doctor;
    _fecha = fecha;
    _hora = hora;
    _motivo = motivo;
  }

  ConsultaMedica.withId(int id, String especialista, String doctor, String fecha, String hora, String motivo){
    _id = id;
    _especialista = especialista;
    _doctor = doctor;
    _fecha = fecha;
    _hora = hora;
    _motivo = motivo;
  }

  // Getters y setters

  int? get id => _id;
  String get especialista => _especialista;
  String get doctor => _doctor;
  String get fecha => _fecha;
  String get hora => _hora;
  String get motivo => _motivo;

  set especialista(String especialista) {
    _especialista = especialista;
  }

  set doctor(String doctor) {
    _doctor = doctor;
  }

  set fecha(String fecha) {
    _fecha = fecha;
  }

  set hora(String hora) {
    _hora = hora;
  }

  set motivo(String motivo) {
    _motivo = motivo;
  }

  // Convertir un objeto de tipo ConsultaMedica a un objeto de tipo Map
  // Esto es útil cuando necesitas guardar un objeto ConsultaMedica en una base de datos o enviarlo a una API

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    if(id != null && id != 0){ // Si el id es diferente de null y 0, significa que el objeto ya existe en la base de datos y solo hay que actualizarlo
      map['id'] = _id;
    }
    map['especialista'] = _especialista;
    map['doctor'] = _doctor;
    map['fecha'] = _fecha;
    map['hora'] = _hora;
    map['motivo'] = _motivo;
    return map;
  }

  // Convertir un objeto tipo Map a un objeto de tipo ConsultaMedica
  // Esto es útil cuando recibes un objeto Map de una API y necesitas convertirlo a un objeto ConsultaMedica

  ConsultaMedica.fromMapObject(dynamic map){ // Constructor que recibe un objeto Map y lo rellena con los datos de las columnas de la tabla
    _id = map['id'];
    _especialista = map['especialista'];
    _doctor = map['doctor'];
    _fecha = map['fecha'];
    _hora = map['hora'];
    _motivo = map['motivo'];
  }


}