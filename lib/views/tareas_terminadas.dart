import 'package:flutter/material.dart';
import 'package:tareas_practica/database/database_helper_tarea.dart';
import 'package:tareas_practica/models/tarea_model.dart';
import '../widgets/tarea.dart';
class TareasTerminadas extends StatefulWidget {
  const TareasTerminadas({Key? key}) : super(key: key);

  @override
  _TareasTerminadasState createState() => _TareasTerminadasState();
}

class _TareasTerminadasState extends State<TareasTerminadas> {
  late DatabaseHelperTarea _databaseHelperTarea;

  refresh() async{
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _databaseHelperTarea = DatabaseHelperTarea();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _databaseHelperTarea.getTareasTerminadas(),
      builder: (BuildContext context,AsyncSnapshot<List<TareaModel>> snapshot) {
        if (snapshot.hasError){
          return Center(
            child: Text('Ocurrio un error en la peticion'),
          );
        }else{
          if (snapshot.connectionState == ConnectionState.done){
            return _listadoTareas(snapshot.data!);
          }else{
            return Center(
              child:CircularProgressIndicator(),
            );
          }
        }

      },
    );



  }

  Widget _listadoTareas(List<TareaModel> tareas){
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(seconds:2),(){
          setState(() {
          });
        });
      },
      child:
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 160,
                width: double.infinity,
                padding: EdgeInsets.only(
                    left: 30,
                    top: 60
                ),

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [

                        Color.fromRGBO(67, 206, 162, 1.0),
                        Color.fromRGBO(24, 90, 157, 1.0),
                      ]
                  ),

                ),
                child: Text(
                  'Tareas completadas',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),
                ),
              )
              ,
              Container(
                margin: EdgeInsets.only(top: 130),
                padding: EdgeInsets.only(
                  top: 1
                ),

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    ),
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(235, 250, 244, 1.0),
                          Color.fromRGBO(255, 255, 255, 1)
                        ]
                    ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 20,
                      spreadRadius: 1
                    )
                  ]
                ),
                child: ListView.builder(
                  itemCount: tareas.length,
                  itemBuilder: (context, index) {
                    var tarea = tareas.elementAt(index);
                    var titulo = tarea.titulo;
                    var tarjeta = CardTarea(tarea.id!,tarea.titulo,tarea.descripcion,tarea.fecha,(DateTime.now().isAfter(DateTime.parse(tarea.fecha!))?true:false),tarea.status,refresh);

                    return tarjeta;

                  },),
              ),

            ],
          ),




    );


  }
}

