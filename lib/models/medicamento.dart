

class Medicamento {
  //Datos generales del medicamento
  int ? _id;
  late String _nombre;
  late String _descripcion;
  late DateTime _fechaCaducidad;
  late String _diaCaducidad;
  late String _tipoEnvase;
  //Prescripción
  late int _dosis;
  late String _frecuencia;
  late String _viaAdministracion;
  late String _duracion;
  //Cantidades del envase y dosis
  late int _cantidadEnvase;
  late int _cantidadMinima;
  late int _cantidadActual;
  //Recordatorio
  late bool _recordatorio;
  late DateTime _fechaInicio;
  late String _diaInicio;
  late DateTime _fechaFin;
  late String _diaFin;
  late bool _activado;
  //Imagen
  //late String _imagenMedicamento;
  //late String _imagenEnvase;
  
  //Notas
  late String _notas;

  //Constructor
  Medicamento(){
    _nombre = '';
    _descripcion = '';
    _fechaCaducidad = DateTime.now();
    _diaCaducidad = this._fechaCaducidad.day.toString() + '/' + this._fechaCaducidad.month.toString() + '/' + this._fechaCaducidad.year.toString();
    _tipoEnvase = '';
    _dosis = 0;
    _frecuencia = '';
    _viaAdministracion = '';
    _duracion = '';
    _cantidadEnvase = 0;
    _cantidadMinima = 0;
    _cantidadActual = 0;
    _recordatorio = false;
    _fechaInicio = DateTime.now();
    _diaInicio = this._fechaInicio.day.toString() + '/' + this._fechaInicio.month.toString() + '/' + this._fechaInicio.year.toString();
    _fechaFin = DateTime.now();
    _diaFin = this._fechaFin.day.toString() + '/' + this._fechaFin.month.toString() + '/' + this._fechaFin.year.toString();
    _activado = false;
    //_imagenMedicamento = '';
    //_imagenEnvase = '';
    _notas = '';

  }
  //Constructor sin id
  Medicamento.sinId(String nombre, String descripcion, DateTime fechaCaducidad, String tipoEnvase, int dosis, String frecuencia, String viaAdministracion, String duracion, int cantidadEnvase, int cantidadMinima, int cantidadActual, bool recordatorio, DateTime fechaInicio, DateTime fechaFin, bool activado, String notas){
    _nombre = '';
    _descripcion = '';
    _fechaCaducidad = DateTime.now();
    _diaCaducidad = this._fechaCaducidad.day.toString() + '/' + this._fechaCaducidad.month.toString() + '/' + this._fechaCaducidad.year.toString();
    _tipoEnvase = '';
    _dosis = 0;
    _frecuencia = '';
    _viaAdministracion = '';
    _duracion = '';
    _cantidadEnvase = 0;
    _cantidadMinima = 0;
    _cantidadActual = 0;
    _recordatorio = false;
    _fechaInicio = DateTime.now();
    _diaInicio = this._fechaInicio.day.toString() + '/' + this._fechaInicio.month.toString() + '/' + this._fechaInicio.year.toString();
    _fechaFin = DateTime.now();
    _diaFin = this._fechaFin.day.toString() + '/' + this._fechaFin.month.toString() + '/' + this._fechaFin.year.toString();
    _activado = false;
    //_imagenMedicamento = '';
    //_imagenEnvase = '';
    _notas = '';
  }
  //Constructor con id
  Medicamento.conId(String nombre, String descripcion, DateTime fechaCaducidad, String tipoEnvase, int dosis, String frecuencia, String viaAdministracion, String duracion, int cantidadEnvase, int cantidadMinima, int cantidadActual, bool recordatorio, DateTime fechaInicio, DateTime fechaFin, bool activado, String notas){
    _nombre = '';
    _descripcion = '';
    _fechaCaducidad = DateTime.now();
    _diaCaducidad = this._fechaCaducidad.day.toString() + '/' + this._fechaCaducidad.month.toString() + '/' + this._fechaCaducidad.year.toString();
    _tipoEnvase = '';
    _dosis = 0;
    _frecuencia = '';
    _viaAdministracion = '';
    _duracion = '';
    _cantidadEnvase = 0;
    _cantidadMinima = 0;
    _cantidadActual = 0;
    _recordatorio = false;
    _fechaInicio = DateTime.now();
    _diaInicio = this._fechaInicio.day.toString() + '/' + this._fechaInicio.month.toString() + '/' + this._fechaInicio.year.toString();
    _fechaFin = DateTime.now();
    _diaFin = this._fechaFin.day.toString() + '/' + this._fechaFin.month.toString() + '/' + this._fechaFin.year.toString();
    _activado = false;
    //_imagenMedicamento = '';
    //_imagenEnvase = '';
    _notas = '';
  }
  
  Medicamento.fromMap(dynamic obj)
  {
    this._id = obj['id'];
    this._nombre = obj['nombre'];
    this._descripcion = obj['descripcion'];
    this._fechaCaducidad = DateTime.parse(obj['fechaCaducidad']);
    this._diaCaducidad = this._fechaCaducidad.day.toString() + '/' + this._fechaCaducidad.month.toString() + '/' + this._fechaCaducidad.year.toString();
    this._tipoEnvase = obj['tipoEnvase'];
    this._dosis = obj['dosis'];
    this._frecuencia = obj['frecuencia'];
    this._viaAdministracion = obj['viaAdministracion'];
    this._duracion = obj['duracion'];
    this._cantidadEnvase = obj['cantidadEnvase'];
    this._cantidadMinima = obj['cantidadMinima'];
    this._cantidadActual = obj['cantidadActual'];
    this._recordatorio = obj['recordatorio'];
    this._fechaInicio = DateTime.parse(obj['fechaInicio']);
    this._diaInicio = this._fechaInicio.day.toString() + '/' + this._fechaInicio.month.toString() + '/' + this._fechaInicio.year.toString();
    this._fechaFin = DateTime.parse(obj['fechaFin']);
    this._diaFin = this._fechaFin.day.toString() + '/' + this._fechaFin.month.toString() + '/' + this._fechaFin.year.toString();
    this._activado = obj['activado'];
    //this._imagenMedicamento = obj['imagenMedicamento'];
    //this._imagenEnvase = obj['imagenEnvase'];
    this._notas = obj['notas'];
  }
  /*
  // Constructor con map
  Medicamento.fromMap(Map<String, dynamic> map) {
    _id = (map['id']!=null)?map['id']:null;
    _nombre = (map['nombre']!=null)?map['nombre']:'';
    _descripcion = (map['descripcion']!=null)?map['descripcion']:'';
    _fechaCaducidad = (map['fechaCaducidad']!=null)?DateTime.parse(map['fechaCaducidad']):DateTime.now();
    
    _tipoEnvase = (map['tipoEnvase']!=null)?map['tipoEnvase']:'';
    _dosis = (map['dosis']!=null)?map['dosis']:0;
    _frecuencia = (map['frecuencia']!=null)?map['frecuencia']:'';
    _viaAdministracion = (map['viaAdministracion']!=null)?map['viaAdministracion']:'';
    _duracion = (map['duracion']!=null)?map['duracion']:'';
    _cantidadEnvase = (map['cantidadEnvase']!=null)?map['cantidadEnvase']:0;
    _cantidadMinima = (map['cantidadMinima']!=null)?map['cantidadMinima']:0;
    _cantidadActual = (map['cantidadActual']!=null)?map['cantidadActual']:0;
    _recordatorio = (map['recordatorio']!=null)?map['recordatorio']:false;
    _fechaInicio = (map['fechaInicio']!=null)?DateTime.parse(map['fechaInicio']):DateTime.now();
    _fechaFin = (map ['fechaFin']!=null)?DateTime.parse(map['fechaFin']):DateTime.now();
    _activado = (map['activado']!=null)?map['activado']:false;
    _imagenMedicamento = (map['imagenMedicamento']!=null)?map['imagenMedicamento']:'';
    _imagenEnvase = (map['imagenEnvase']!=null)?map['imagenEnvase']:'';
    _notas = (map['notas']!=null)?map['notas']:'';
  }
  */

  //Getters y setters
  int ? get id => _id;
  String get nombre => _nombre;
  String get descripcion => _descripcion;
  DateTime get fechaCaducidad => _fechaCaducidad;
  String get diaCaducidad => _diaCaducidad;
  String get tipoEnvase => _tipoEnvase;
  int get dosis => _dosis;
  String get frecuencia => _frecuencia;
  String get viaAdministracion => _viaAdministracion;
  String get duracion => _duracion;
  int get cantidadEnvase => _cantidadEnvase;
  int get cantidadMinima => _cantidadMinima;
  int get cantidadActual => _cantidadActual;
  bool get recordatorio => _recordatorio;
  DateTime get fechaInicio => _fechaInicio;
  String get diaInicio => _diaInicio;
  DateTime get fechaFin => _fechaFin;
  String get diaFin => _diaFin;
  bool get activado => _activado;
  //String get imagenMedicamento => _imagenMedicamento;
  //String get imagenEnvase => _imagenEnvase;
  String get notas => _notas;

  set nombre(String nombre) {
    _nombre = nombre;
  }

  set descripcion(String descripcion) {
    _descripcion = descripcion;
  }

  set fechaCaducidad(DateTime fechaCaducidad) {
    this.fechaCaducidad = fechaCaducidad;
    this._diaCaducidad = this._fechaCaducidad.day.toString() + '/' + this._fechaCaducidad.month.toString() + '/' + this._fechaCaducidad.year.toString();
    
  }

  set diaCaducidad(String diaCaducidad) {
    this._diaCaducidad = diaCaducidad;
    List<String> fecha = diaCaducidad.split('/');
    int dd = int.tryParse(fecha[0])!;
    int mm = int.tryParse(fecha[1])!;
    int yyyy = int.tryParse(fecha[2])!;
    this._fechaCaducidad = new DateTime(yyyy, mm, dd);
  }

  set tipoEnvase(String tipoEnvase) {
    _tipoEnvase = tipoEnvase;
  }

  set dosis(int dosis) {
    _dosis = dosis;
  }

  set frecuencia(String frecuencia) {
    _frecuencia = frecuencia;
  }

  set viaAdministracion(String viaAdministracion) {
    _viaAdministracion = viaAdministracion;
  }

  set duracion(String duracion) {
    _duracion = duracion;
  }

  set cantidadEnvase(int cantidadEnvase) {
    _cantidadEnvase = cantidadEnvase;
  }

  set cantidadMinima(int cantidadMinima) {
    _cantidadMinima = cantidadMinima;
  }

  set cantidadActual(int cantidadActual) {
    _cantidadActual = cantidadActual;
  }

  set recordatorio(bool recordatorio) {
    _recordatorio = recordatorio;
  }

  set fechaInicio(DateTime fechaInicio) {
    _fechaInicio = fechaInicio;
  }

  set diaInicio(String diaInicio) {
    this._diaInicio = diaInicio;
    List<String> fecha = diaInicio.split('/');
    int dd = int.tryParse(fecha[0])!;
    int mm = int.tryParse(fecha[1])!;
    int yyyy = int.tryParse(fecha[2])!;
    this._fechaInicio = new DateTime(yyyy, mm, dd);
  }

  set fechaFin(DateTime fechaFin) {
    _fechaFin = fechaFin;
  }

  set diaFin(String diaFin) {
    this._diaFin = diaFin;
    List<String> fecha = diaFin.split('/');
    int dd = int.tryParse(fecha[0])!;
    int mm = int.tryParse(fecha[1])!;
    int yyyy = int.tryParse(fecha[2])!;
    this._fechaFin = new DateTime(yyyy, mm, dd);
  }

  set activado(bool activado) {
    _activado = activado;
  }

  // set imagenMedicamento(String imagenMedicamento) {
  //   _imagenMedicamento = imagenMedicamento;
  // }

  // set imagenEnvase(String imagenEnvase) {
  //   _imagenEnvase = imagenEnvase;
  // }

  set notas(String notas) {
    _notas = notas;
  }

  //Método para convertir un medicamento en un map

  /*Descripcion de como funciona la funcion toMap: 
   - Se crea un map de tipo String y valores del tipo dynamic
   - Cada clave corresponde a un atributo del objeto medicamento
   - Se asigna los valores de los atributos del objeto medicamento a las claves del map
   - Si el id es distinto de null, se asigna el valor del id al map
   - Para convertir un objeto en un map, se llama a la función toMap
  */

  /*

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'nombre': _nombre,
      'descripcion': _descripcion,
      'fechaCaducidad': _fechaCaducidad.toString(),
      'tipoEnvase': _tipoEnvase,
      'dosis': _dosis,
      'frecuencia': _frecuencia,
      'viaAdministracion': _viaAdministracion,
      'duracion': _duracion,
      'cantidadEnvase': _cantidadEnvase,
      'cantidadMinima': _cantidadMinima,
      'cantidadActual': _cantidadActual,
      'recordatorio': _recordatorio,
      'fechaInicio': _fechaInicio.toString(),
      'fechaFin': _fechaFin.toString(),
      'activado': _activado,
      'imagenMedicamento': _imagenMedicamento,
      'imagenEnvase': _imagenEnvase,
      'notas': _notas,
    };
    if (_id != null) {
      map['id'] = _id;
    }
    return map;
  }

  */

  Map<String, dynamic> toMap()
  {
    var map = new Map<String, dynamic>();
    if(id != null && id != 0)
    {
      map['id'] = _id;
    }
    map['nombre'] = _nombre;
    map['descripcion'] = _descripcion;
    map['fechaCaducidad'] = _fechaCaducidad.toString();
    map['tipoEnvase'] = _tipoEnvase;
    map['dosis'] = _dosis;
    map['frecuencia'] = _frecuencia;
    map['viaAdministracion'] = _viaAdministracion;
    map['duracion'] = _duracion;
    map['cantidadEnvase'] = _cantidadEnvase;
    map['cantidadMinima'] = _cantidadMinima;
    map['cantidadActual'] = _cantidadActual;
    map['recordatorio'] = _recordatorio;
    map['fechaInicio'] = _fechaInicio.toString();
    map['fechaFin'] = _fechaFin.toString();
    map['activado'] = _activado;
    //map['imagenMedicamento'] = _imagenMedicamento;
    //map['imagenEnvase'] = _imagenEnvase;
    map['notas'] = _notas;
    return map;
  }
    

}