import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:farmacofy/inicioSesion/pantallaRegistro.dart';
 
class Usuario {
  final int? id;
  final String nombre;
  final String usuario;
  final String contrasena;
  final bool administrador;
  final int? idAdministrador;
 
  Usuario({
    this.id,
    required this.nombre,
    required this.usuario,
    required this.contrasena,
    required this.administrador,
    required this.idAdministrador,
  });
 
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'usuario': usuario,
      'contrasena': contrasena,
      'administrador': administrador ? 1 : 0, // Convertir booleano a 0 o 1
      'id_administrador': idAdministrador,
    };
  }
}
 
class BaseDeDatosUsuarios {
  late Database _database;
 
  Future<void> abrirBaseDeDatos() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'prueba.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE usuarios(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, usuario TEXT, contrasena TEXT, administrador INTEGER, id_administrador INTEGER)',
        );
      },
      version: 2,
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