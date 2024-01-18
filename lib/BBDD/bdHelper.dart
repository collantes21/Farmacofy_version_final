// base_de_datos_usuarios.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

sqfliteFfiInit() {
  // TODO: implement sqfliteFfiInit
  throw UnimplementedError();
}

class Usuario {
  final int? id;
  final String nombre;
  final String usuario;
  final String contrasena;

  Usuario({
    this.id,
    required this.nombre,
    required this.usuario,
    required this.contrasena,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'usuario': usuario,
      'contrasena': contrasena,
    };
  }
}

class BaseDeDatosUsuarios {
  late Database _database;

  Future<void> abrirBaseDeDatos() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'farmacofy.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE usuarios(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, usuario TEXT, contrasena TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<int> registrarUsuario(Usuario usuario) async {
    await abrirBaseDeDatos();
    final idUsuario = await _database.insert('usuarios', usuario.toMap());
    await cerrarBaseDeDatos();
    return idUsuario;
  }

  Future<bool> verificarUsuarioExistente(String usuario) async {
    await abrirBaseDeDatos();
    final result = await _database.query(
      'usuarios',
      where: 'usuario = ?',
      whereArgs: [usuario],
    );
    await cerrarBaseDeDatos();
    return result.isNotEmpty;
  }

  Future<bool> verificarCredenciales(String usuario, String contrasena) async {
    await abrirBaseDeDatos();
    final result = await _database.query(
      'usuarios',
      where: 'usuario = ? AND contrasena = ?',
      whereArgs: [usuario, contrasena],
    );
    await cerrarBaseDeDatos();
    return result.isNotEmpty;
  }

  Future<void> cerrarBaseDeDatos() async {
    await _database.close();
  }
}
