import 'package:farmacofy/models/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BaseDeDatos {
  static Database? _database;
  static const String nombreBD = "farmacofy1.db";

  // Iniciar la base de datos
  static Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await inicializarBD();
    return _database;
  }

// Método privado para inicializar la base de datos
static Future<Database> inicializarBD() async {
  var directorio = await getDatabasesPath();
  String path = join(directorio, nombreBD);
  var baseDatos = await openDatabase(
    path,
    version: 7, // Incrementa la versión de la base de datos para aplicar los cambios
    onCreate: (Database db, int version) async {
      await db.execute(
         "CREATE TABLE IF NOT EXISTS Consulta(id INTEGER PRIMARY KEY, especialista TEXT, doctor TEXT, fecha TEXT, hora TEXT, motivo TEXT, idUsuario INTEGER, FOREIGN KEY(idUsuario) REFERENCES Usuarios(id) ON DELETE CASCADE)");
      await db.execute(
          "CREATE TABLE IF NOT EXISTS Medicamento(id INTEGER PRIMARY KEY, nombre TEXT, prospecto TEXT, fechaCaducidad TEXT, tipoEnvase TEXT, cantidadEnvase INTEGER)");

      await db.execute(
          "CREATE TABLE IF NOT EXISTS Tratamiento(id INTEGER PRIMARY KEY, condicionMedica TEXT, dosis INTEGER, frecuencia INTEGER, viaAdministracion TEXT, fechaInicio TEXT, fechaFin TEXT, descripcion TEXT, recordatorio INTEGER, idMedicamento INTEGER, idUsuario INTEGER, dia TEXT, horaInicioToma TEXT, cantidadTotalPastillas INTEGER, cantidadMinima INTEGER, FOREIGN KEY(idMedicamento) REFERENCES Medicamento(id), FOREIGN KEY(idUsuario) REFERENCES Usuarios(id) ON DELETE CASCADE)");

      await db.execute(
          'CREATE TABLE IF NOT EXISTS Usuarios(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, usuario TEXT, contrasena TEXT, administrador INTEGER, id_administrador INTEGER)');
    },
  );
  return baseDatos;
}


  // Método para registrar un usuario
  static Future<int> registrarUsuario(Usuario usuario) async {
    final db = await database;
    final idUsuario = await db!.insert('Usuarios', usuario.toMap());
    return idUsuario;
  }

  // Método para verificar la existencia de un usuario
  static Future<bool> verificarUsuarioExistente(String usuario) async {
    final db = await database;
    final result = await db!.query(
      'Usuarios',
      where: 'usuario = ?',
      whereArgs: [usuario],
    );
    return result.isNotEmpty;
  }

  // Método para verificar las credenciales de un usuario
  static Future<bool> verificarCredenciales(
      String usuario, String contrasena) async {
    final db = await database;
    final result = await db!.query(
      'Usuarios',
      where: 'usuario = ? AND contrasena = ?',
      whereArgs: [usuario, contrasena],
    );
    return result.isNotEmpty;
  }

  // Método para cerrar la base de datos
  static Future<void> cerrarBaseDeDatos() async {
    final db = await database;
    await db!.close();
  }

  // Consultar la tabla entera en la base de datos
  static Future<List<Map<String, dynamic>>> consultarBD(String tabla) async {
    final db = await database;
    var resultado = await db!.query(tabla);
    return resultado;
  }
 

  // Consulta con SQL
  static Future<List<Map<String, dynamic>>> consultarSQL(String sql) async {
    final db = await database;
    var resultado = await db!.rawQuery(sql);
    return resultado;
  }

  // Insertar datos en la base de datos
  static Future<int> insertarBD(String tabla, Map<String, dynamic> fila) async {
    final db = await database;
    var resultado = await db!.insert(tabla, fila);
    return resultado;
  }

  static Future<int> insertarBDDevuelveId(String tabla, Map<String, dynamic> fila) async {
  final db = await database;
  int id = await db!.insert(tabla, fila);
  return id;
}

  // Eliminar datos de la base de datos
  static Future<int> eliminarBD(String tabla, int id) async {
    final db = await database;
    var resultado = await db!.delete(tabla, where: 'id = ?', whereArgs: [id]);
    return resultado;
  }

  // Actualizar datos de la base de datos
  static Future<int> actualizarBD(
      String tabla, Map<String, dynamic> fila) async {
    final db = await database;
    var resultado =
        await db!.update(tabla, fila, where: 'id = ?', whereArgs: [fila['id']]);
    return resultado;
  }

  static Future<bool?> obtenerRolAdministrador(int idUsuario) async {
  final db = await database;
  final result = await db!.query(
    'Usuarios',
    columns: ['administrador'],
    where: 'id = ?',
    whereArgs: [idUsuario],
  );
  if (result.isNotEmpty) {
    final bool esAdmin = result.first['administrador'] == 1;
    return esAdmin;
  } else {
    return null;
  }
}

  // Método para obtener la horaInicio y fechaInicio de un tratamiento por su idTratamiento
  static Future<Map<String, dynamic>?> obtenerHoraFechaInicio(int idTratamiento) async {
    final db = await inicializarBD();
    final List<Map<String, dynamic>> result = await db.query(
      'Tratamiento',
      columns: ['horaInicioToma', 'fechaInicio'],
      where: 'id = ?',
      whereArgs: [idTratamiento],
    );
    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  //Es el metodo antiguo que lista sin tener en cuenta el idUsuario

  // // Consultar tratamientos con medicamentos
  // static Future<List<Map<String, dynamic>>>
  //     consultarTratamientosConMedicamentos() async {
  //   final db = await database;
  //   final resultado = await db!.rawQuery(
  //     "SELECT t.id, t.condicionMedica, t.dosis, t.frecuencia, t.viaAdministracion, t.fechaInicio, t.fechaFin, t.descripcion, t.recordatorio, t.idMedicamento, m.nombre as nombreMedicamento, m.prospecto, m.fechaCaducidad, m.tipoEnvase, m.cantidadEnvase FROM Tratamiento t INNER JOIN Medicamento m ON t.idMedicamento = m.id",
  //   );
  //   return resultado;
  // }


//Metodo que lista sin meter lo campos nuevos para el control del stockage
//   static Future<List<Map<String, dynamic>>> consultarTratamientosConMedicamentosPorUsuario(int idUsuario) async {
//   final db = await database;
//   final resultado = await db!.rawQuery(
//     "SELECT t.id, t.condicionMedica, t.dosis, t.frecuencia, t.viaAdministracion, t.fechaInicio, t.fechaFin, t.descripcion, t.recordatorio, t.idMedicamento, m.nombre as nombreMedicamento, m.prospecto, m.fechaCaducidad, m.tipoEnvase, m.cantidadEnvase FROM Tratamiento t INNER JOIN Medicamento m ON t.idMedicamento = m.id WHERE t.idUsuario = ?",
//     [idUsuario],
//   );
//   return resultado;
// }

static Future<List<Map<String, dynamic>>> consultarTratamientosConMedicamentosPorUsuario(int idUsuario) async {
  final db = await database;
  final resultado = await db!.rawQuery(
    "SELECT t.id, t.condicionMedica, t.dosis, t.frecuencia, t.viaAdministracion, t.fechaInicio, t.fechaFin, t.descripcion, t.recordatorio, t.idMedicamento, t.idUsuario, t.horaInicioToma, t.cantidadTotalPastillas, t.cantidadMinima, m.nombre as nombreMedicamento, m.prospecto, m.fechaCaducidad, m.tipoEnvase, m.cantidadEnvase FROM Tratamiento t INNER JOIN Medicamento m ON t.idMedicamento = m.id WHERE t.idUsuario = ?",
    [idUsuario],
  );
  return resultado;
}

 // Consultar Consultas por usuario
  static Future<List<Map<String, dynamic>>> consultarConsultasPorUsuario(int idUsuario) async {
  final db = await database;
  final resultado = await db!.rawQuery(
    "SELECT * FROM Consulta WHERE idUsuario = ?",
    [idUsuario],
  
  );
  return resultado;
}

  // Consulta para conocer el valor de la columna administrador

  static Future<bool?> obtenerRolUsuario(String usuario) async {
    final db = await database;
    final result = await db!.query(
      'Usuarios',
      columns: ['administrador'],
      where: 'usuario = ?',
      whereArgs: [usuario],
    );
    if (result.isNotEmpty) {
      final bool esAdmin = result.first['administrador'] == 1;
      return esAdmin;
    } else {
      return null;
    }
  }

  // Método para obtener el id_usuario dado el nombre de usuario
  static Future<int?> obtenerIdUsuario(String usuario) async {
    final db = await database;
    final result = await db!.query(
      'Usuarios',
      columns: ['id'],
      where: 'usuario = ?',
      whereArgs: [usuario],
    );
    if (result.isNotEmpty) {
      return result.first['id'] as int;
    } else {
      return null;
    }
  }

  // Consultar la tabla entera en la base de datos
static Future<List<Map<String, dynamic>>> consultarUsuariosPorIdAdministrador(int idAdministrador) async {
  final db = await database;
  var resultado = await db!.query(
    'Usuarios',
    where: 'id_administrador = ?',
    whereArgs: [idAdministrador],
  );
  return resultado;
}

// Método para obtener la cantidad total de pastillas de un tratamiento dado su ID
  static Future<int?> obtenerCantidadTotalPastillas(int idTratamiento) async {
    final db = await inicializarBD();
    final List<Map<String, dynamic>> resultados = await db.query(
      'Tratamiento',
      where: 'id = ?',
      whereArgs: [idTratamiento],
    );
    if (resultados.isNotEmpty) {
      return resultados.first['cantidadTotalPastillas'] as int?;
    }
    return null; // Retornar null si no se encuentra el tratamiento
  }


// Método para actualizar la cantidad total de pastillas de un tratamiento dado su ID
  static Future<void> actualizarCantidadTotalPastillas(int idTratamiento, int nuevaCantidad) async {
    final db = await inicializarBD();
    await db.update(
      'Tratamiento',
      {'cantidadTotalPastillas': nuevaCantidad},
      where: 'id = ?',
      whereArgs: [idTratamiento],
    );
  }

  // Método para obtener la cantidad mínima de pastillas de un tratamiento dado su ID
static Future<int?> obtenerCantidadMinimaPastillas(int idTratamiento) async {
  final db = await inicializarBD();
  final List<Map<String, dynamic>> resultados = await db.query(
    'Tratamiento',
    where: 'id = ?',
    whereArgs: [idTratamiento],
  );
  if (resultados.isNotEmpty) {
    return resultados.first['cantidadMinima'] as int?;
  }
  return null; // Retornar null si no se encuentra el tratamiento
}

// Método para obtener el nombre del medicamento dado su ID
static Future<String> obtenerNombreMedicamento(int idMedicamento) async {
  final db = await inicializarBD();
  final List<Map<String, dynamic>> resultados = await db!.query(
    'Medicamento',
    columns: ['nombre'],
    where: 'id = ?',
    whereArgs: [idMedicamento],
  );
  if (resultados.isNotEmpty) {
    return resultados.first['nombre'] as String;
  } else {
    // Si no se encuentra el medicamento, puedes retornar un valor por defecto o lanzar una excepción
    throw Exception('No se encontró el medicamento con el ID $idMedicamento');
  }
}

// Método para obtener el ID del medicamento dado el ID del tratamiento
static Future<int?> obtenerIdMedicamento(int idTratamiento) async {
  final db = await inicializarBD();
  final List<Map<String, dynamic>> resultados = await db.query(
    'Tratamiento',
    columns: ['idMedicamento'],
    where: 'id = ?',
    whereArgs: [idTratamiento],
  );
  if (resultados.isNotEmpty) {
    return resultados.first['idMedicamento'] as int?;
  } else {
    // Si no se encuentra el tratamiento, puedes retornar null o lanzar una excepción
    return null;
  }
}

// Método para obtener la cantidad total de pastillas de un tratamiento dado su ID
  // static Future<int?> obtenerCantidadTotalPastillas(int idTratamiento) async {
  //   final db = await inicializarBD();
  //   final List<Map<String, dynamic>> resultados = await db.query(
  //     'Tratamiento',
  //     where: 'id = ?',
  //     whereArgs: [idTratamiento],
  //   );
  //   if (resultados.isNotEmpty) {
  //     return resultados.first['cantidadTotalPastillas'] as int?;
  //   }
  //   return null; // Retornar null si no se encuentra el tratamiento
  // }


}
