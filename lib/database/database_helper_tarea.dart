import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:tareas_practica/models/tarea_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperTarea {
//constante estatica
  static final _nombreBD = 'TAREAS';
  static final _versionDB = 1;
  static final _nombreTBL = 'tblTarea';

  static Database? _database;
  //si esta creada la base de datos o no
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDataBase();
    return _database;
  }

  Future<Database> _initDataBase() async {
    //donde se guardara el archivo
    Directory carpeta = await getApplicationDocumentsDirectory();

    //ruta completa a la BD
    String rutaDB = join(carpeta.path, _nombreBD);
    return openDatabase(rutaDB, version: _versionDB, onCreate: _crearTabla);
  }

  //tabla que guarda los datos del perfil
  Future<void> _crearTabla(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $_nombreTBL(id INTEGER PRIMARY KEY, titulo VARCHAR(100), descripcion VARCHAR(100), fecha STRING, status INTEGER(1))");
  }

  Future<int> insert(Map<String, dynamic> row) async {
    var conexion = await database;

    //la conexion no debe de ser nula para que ejecute el insert
    return conexion!.insert(_nombreTBL, row);
    //registra el id del ultimo valor insertado
  }

  Future<int> update(Map<String, dynamic> row) async {
    var conexion = await database;
    return conexion!
        .update(_nombreTBL, row, where: 'id = ?', whereArgs: [row['id']]);
  }
  Future<int> delete(Map<String, dynamic> row) async {
    var conexion = await database;
    return conexion!
        .delete(_nombreTBL, where: 'id = ?', whereArgs: [row['id']]);
  }

  Future<int> numCompletadas() async {
    var conexion = await database;
    var result =    await conexion!.query(_nombreTBL,where: 'status=1');

    return result.length;
  }
  Future<int> numPendientes() async {
    var conexion = await database;
    var result =    await conexion!.query(_nombreTBL,where: 'status=0');

    return result.length;
  }
  Future<int> numVencidas() async {
    var conexion = await database;
    var result =    await conexion!.rawQuery("SELECT (strftime('%s','now') - strftime('%s',t.fecha)) as tiempo from tblTarea t where tiempo>0 and t.status==0");

    return result.length;
  }

  Future<List<TareaModel>> getTareasPendientes() async {
    var conexion = await database;
    var result =    await conexion!.query(_nombreTBL,where: 'status=0');

      return result.map((tareaMap) => TareaModel.fromMap(tareaMap)).toList();

  }

  Future<List<TareaModel>> getTareasTerminadas() async {
    var conexion = await database;
    var result =    await conexion!.query(_nombreTBL,where: 'status=1');

    return result.map((tareaMap) => TareaModel.fromMap(tareaMap)).toList();

  }

  Future<TareaModel> getTarea(int id) async {
    var conexion = await database;
    var result =
    await conexion!.query(_nombreTBL, where: 'id = ?', whereArgs: [id]);
    //result.map((notaMap) => NotasModel.fromMap(notaMap)).first;
    return TareaModel.fromMap(result.first);
  }

}
