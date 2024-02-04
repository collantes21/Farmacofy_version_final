import 'package:sqflite/sqflite.dart';

//helper para la base de datos
class BDHelper{
  static Database? _baseDatos;
  static const String nombreBD = "farmacofyBD.db";

  //iniciar la base de datos
  Future<Database?> get baseDatos async{
    if(_baseDatos != null){
      return _baseDatos;
    }
    _baseDatos = await _inicializarBD();
    return _baseDatos;
  }

  //consultar la tabla entera en la base de datos
  Future<List<Map<String, dynamic>>> consultarBD(String tabla) async{
    Database? bd = await baseDatos;
    var resultado = await bd!.query(tabla);
    return resultado;
  }

  //consulta con sql
  Future<List<Map<String, dynamic>>> consultarSQL(String sql) async{
    Database? bd = await baseDatos;
    var resultado = await bd!.rawQuery(sql);
    return resultado;
  }

  //insertar datos en la base de datos
  Future<int> insertarBD(String tabla, Map<String, dynamic> fila) async{
    Database? bd = await baseDatos;
    var resultado = await bd!.insert(tabla, fila);
    return resultado;
  }

  //eliminar datos de la base de datos
  Future<int> eliminarBD(String tabla, int id) async{
    Database? bd = await baseDatos;
    var resultado = await bd!.delete(tabla, where: 'id = ?', whereArgs: [id]);
    return resultado;
  }

  //actualizar datos de la base de datos
  Future<int> actualizarBD(String tabla, Map<String, dynamic> fila) async{
    Database? bd = await baseDatos;
    var resultado=0;
    if (bd!=null)
    {
      resultado = await bd.update(tabla, fila, where: 'id = ?', whereArgs: [fila['id']]);
    }
    
    return resultado;
  }

  

  _inicializarBD() async{
    var directorio = await getDatabasesPath();
    String path = directorio+nombreBD;
    var baseDatos = await openDatabase(
      path, 
      version: 4, 
      onCreate: (Database db, int version) async{

        await db.execute(
           "CREATE TABLE IF NOT EXISTS Consulta(id INTEGER PRIMARY KEY, especialista TEXT, doctor TEXT, fecha TEXT, hora TEXT, motivo TEXT)"
         );

        await db.execute(
          "CREATE TABLE IF NOT EXISTS Medicamento(id INTEGER PRIMARY KEY, nombre TEXT, prospecto TEXT, fechaCaducidad TEXT, tipoEnvase TEXT, cantidadEnvase INTEGER)"
        );
        
        // para añadir una segunda tabla a la base de datos
         await db.execute(
           "CREATE TABLE IF NOT EXISTS Tratamiento(id INTEGER PRIMARY KEY, condicionMedica TEXT, dosis INTEGER, frecuencia INTEGER, viaAdministracion TEXT, fechaInicio TEXT, fechaFin TEXT, descripcion TEXT, recordatorio INTEGER, idMedicamento INTEGER, FOREIGN KEY(idMedicamento) REFERENCES Medicamento(id))"
         );
         
      },
       onUpgrade: (Database db, int oldVersion, int newVersion) async {
      // Aquí es donde manejas la lógica para actualizar la base de datos
      if (oldVersion < 4) { // Si la versión anterior es menor que 2, significa que la base de datos no tiene la tabla "Consulta"
        await db.execute(
          // Modificar una tabla existente con un nuevo campo
          // "ALTER TABLE Consulta ADD COLUMN nueva columna TEXT"
          "ALTER TABLE Tratamiento ADD COLUMN condicionMedica TEXT"
        );
      }
    }
  );
      
    return baseDatos;
  }

  Future<List<Map<String, dynamic>>> consultarTratamientosConMedicamentos() async {
    // Database? bd = await baseDatos;
    final bd = await baseDatos;
    final resultado = await bd!.rawQuery(
      "SELECT t.id, t.condicionMedica, t.dosis, t.frecuencia, t.viaAdministracion, t.fechaInicio, t.fechaFin, t.descripcion, t.recordatorio, t.idMedicamento, m.nombre as nombreMedicamento, m.prospecto, m.fechaCaducidad, m.tipoEnvase, m.cantidadEnvase FROM Tratamiento t INNER JOIN Medicamento m ON t.idMedicamento = m.id"
    );
    return resultado;
  }
}