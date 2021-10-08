import 'package:flutter/material.dart';
import 'tarea.dart';
class TareasTerminadas extends StatefulWidget {
  const TareasTerminadas({Key? key}) : super(key: key);

  @override
  _TareasTerminadasState createState() => _TareasTerminadasState();
}

class _TareasTerminadasState extends State<TareasTerminadas> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 110),
          child: ListView(
            children: [
              CardTarea(),
              CardTarea(),
              CardTarea(),
              CardTarea(),
              CardTarea(),
              CardTarea(),
              CardTarea(),
              CardTarea(),

            ],
          ),
        ),

        Container(
          height: 120,
          decoration: BoxDecoration(
              gradient:LinearGradient(
                colors:[Color.fromRGBO(21, 203, 123, 1.0),
                  Color.fromRGBO(7, 182, 176, 1)],
                tileMode: TileMode.clamp,
                begin: FractionalOffset(0,0),
                end: FractionalOffset(1,0),
              ),
              boxShadow: [
                BoxShadow(color: Colors.black12,
                  blurRadius: 8,
                  spreadRadius: 5,
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),

              )
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 60,
                    left: 20),
                alignment: Alignment.topLeft,
                child: Text('Tareas terminadas',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ],
          ),

        ),

      ],
    )
    ;
  }
}
