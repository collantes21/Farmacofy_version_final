
class Tratamiento {
  int? _id;
  late String _condicionMedica;
  late int _dosis;
  late int _frecuencia;
  late String _viaAdministracion;
  late String _fechaInicio;
  late String _fechaFin;
  late String _descripcion;
  late int _recordatorio;
  late int _idMedicamento;

  Tratamiento(){
    _condicionMedica = "";
    _dosis = 0;
    _frecuencia = 0;
    _viaAdministracion = "";
    _fechaInicio = "";
    _fechaFin = "";
    _descripcion = "";
    _recordatorio = 0;
    _idMedicamento = 0;
  }

  Tratamiento.withData(String condicionMedica, int dosis, int frecuencia, String viaAdministracion, String fechaInicio, String fechaFin, String descripcion, int recordatorio, int idMedicamento){
    _condicionMedica = condicionMedica;
    _dosis = dosis;
    _frecuencia = frecuencia;
    _viaAdministracion = viaAdministracion;
    _fechaInicio = fechaInicio;
    _fechaFin = fechaFin;
    _descripcion = descripcion;
    _recordatorio = recordatorio;
    _idMedicamento = idMedicamento;
  }

  Tratamiento.withId(String condicionMedica, int id, int dosis, int frecuencia, String viaAdministracion, String fechaInicio, String fechaFin, String descripcion, int recordatorio, int idMedicamento){
    _id = id;
    _condicionMedica = condicionMedica;
    _dosis = dosis;
    _frecuencia = frecuencia;
    _viaAdministracion = viaAdministracion;
    _fechaInicio = fechaInicio;
    _fechaFin = fechaFin;
    _descripcion = descripcion;
    _recordatorio = recordatorio;
    _idMedicamento = idMedicamento;
  }

  // Getters y setters

  int? get id => _id;
  String get condicionMedica => _condicionMedica;
  int get dosis => _dosis;
  int get frecuencia => _frecuencia;
  String get viaAdministracion => _viaAdministracion;
  String get fechaInicio => _fechaInicio;
  String get fechaFin => _fechaFin;
  String get descripcion => _descripcion;
  int get recordatorio => _recordatorio;
  int get idMedicamento => _idMedicamento;

  set condicionMedica(String condicionMedica) {
    _condicionMedica = condicionMedica;
  }
  
  set dosis(int dosis) {
    _dosis = dosis;
  }

  set frecuencia(int frecuencia) {
    _frecuencia = frecuencia;
  }

  set viaAdministracion(String viaAdministracion) {
    _viaAdministracion = viaAdministracion;
  }

  set fechaInicio(String fechaInicio) {
    _fechaInicio = fechaInicio;
  } 

  set fechaFin(String fechaFin) {
    _fechaFin = fechaFin;
  }

  set descripcion(String descripcion) {
    _descripcion = descripcion;
  }

  set recordatorio(int recordatorio) {
    _recordatorio = recordatorio;
  }

  set idMedicamento(int idMedicamento) {
    _idMedicamento = idMedicamento;
  }

  // Convertir un objeto de tipo Tratamiento a un objeto de tipo Map

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    if(id != null && id != 0){
      map['id'] = _id;
    }
    map['condicionMedica'] = _condicionMedica;
    map['dosis'] = _dosis;
    map['frecuencia'] = _frecuencia;
    map['viaAdministracion'] = _viaAdministracion;
    map['fechaInicio'] = _fechaInicio;
    map['fechaFin'] = _fechaFin;
    map['descripcion'] = _descripcion;
    map['recordatorio'] = _recordatorio;
    map['idMedicamento'] = _idMedicamento;
    return map;
  }

  // Convertir un objeto Map a un objeto de tipo Tratamiento

  Tratamiento.fromMapObject(Map<String, dynamic> map){
    _id = map['id'];
    _condicionMedica = map['condicionMedica'];
    _dosis = map['dosis'];
    _frecuencia = map['frecuencia'];
    _viaAdministracion = map['viaAdministracion'];
    _fechaInicio = map['fechaInicio'];
    _fechaFin = map['fechaFin'];
    _descripcion = map['descripcion'];
    _recordatorio = map['recordatorio'];
    _idMedicamento = map['idMedicamento'];
  }



}

