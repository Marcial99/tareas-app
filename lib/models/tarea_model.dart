import 'package:flutter/foundation.dart';

class TareaModel {
  int? id;
  String? titulo;
  String? descripcion;
  String? fecha;
  int? status;


  /*NotasModel(int id, String titulo, String detalle) {
    this.id = id;
    this.titulo = titulo;
    this.detalle = detalle;
  } */

  TareaModel({this.id, this.titulo, this.descripcion,this.fecha,this.status});

  // Map -> Object
  //constructores nombrados
  factory TareaModel.fromMap(Map<String, dynamic> map) {
    return TareaModel(
        id: map['id'], titulo: map['titulo'], descripcion: map['descripcion'],fecha:map['fecha'],status: map['status']);
  }

  // Object -> Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'titulo': titulo, 'descripcion': descripcion, 'fecha':fecha, 'status':status};
  }
}