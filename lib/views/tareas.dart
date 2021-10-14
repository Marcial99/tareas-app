
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tareas_practica/database/database_helper_tarea.dart';
import 'package:tareas_practica/models/tarea_model.dart';
import 'package:tareas_practica/views/home.dart';
import '../widgets/tarea.dart';
import 'package:flutter/animation.dart';
class Tareas extends StatefulWidget {
  final Function cambiar;
  Tareas(this.cambiar);

  @override
  _TareasState createState() => _TareasState();
}

class _TareasState extends State<Tareas> {
  late DatabaseHelperTarea _databaseHelperTarea;
  var terminadas;
  var pendientes;
  var vencidas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _databaseHelperTarea = DatabaseHelperTarea();
    refresh();
     }

  refresh() async{
    setState(() {
      tareas();
    });
  }
  Future<void> tareas () async{
    _databaseHelperTarea.numCompletadas().then((value) => this.terminadas=value);
    _databaseHelperTarea.numPendientes().then((value) => this.pendientes=value);
    _databaseHelperTarea.numVencidas().then((value) => this.vencidas=value);

  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _databaseHelperTarea.getTareasPendientes(),
      builder: (BuildContext context,AsyncSnapshot<List<TareaModel>> snapshot) {
        if (snapshot.hasError){
          return Center(
            child: Text('Ocurrio un error en la peticion'),
          );
        }else{
          if (snapshot.connectionState == ConnectionState.done){
            tareas();
            return _listadoTareas(snapshot.data!,this.pendientes.toString(),this.terminadas.toString(),this.vencidas.toString());
          }else{
            return Center(
              child:CircularProgressIndicator(),
            );
          }
        }

      },
    );
  
}

  Widget _listadoTareas(List<TareaModel> tareas,var pendientes,var terminadas,var vencidas){
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(milliseconds: 200),(){
          setState(() {
          });
        });
      },
      child: Column(
        children: [
          Expanded(child:
          Container(

            decoration: BoxDecoration(

              /*boxShadow: [
              BoxShadow(color: Colors.black12,
              blurRadius: 8,
              spreadRadius: 5,
              )
            ]*/
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),

                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(


                  children: [
                    Expanded(child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 60,
                              left: 20),
                          alignment: Alignment.topLeft,
                          child: Text('Hola,',
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 30,
                                fontWeight: FontWeight.w400
                            ),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5,
                              left: 20),
                          alignment: Alignment.topLeft,
                          child: Text('Olina Secona',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 34,
                                fontWeight: FontWeight.bold
                            ),),
                        ),
                      ],
                    ),
                      flex: 8,)
                    ,
                    Expanded(child:
                    Container(
                      alignment: Alignment.topRight,
                      width: 80,
                      height: 80,
                      margin: EdgeInsets.only(
                          right: 25,
                          top: 35
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('https://www.webconsultas.com/sites/default/files/styles/wc_adaptive_image__small/public/articulos/perfil-resilencia.jpg',),
                            fit: BoxFit.cover

                        ),
                        borderRadius: BorderRadius.circular(30),


                      ),
                      padding: EdgeInsets.all(0),

                    ),
                      flex: 3,)




                  ],

                ),
                Container(
                  alignment: Alignment.center,
                  width: 180,
                  height: 60,
                  margin: EdgeInsets.only(
                      left: 0,
                      top: 5
                  ),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [

                      ]
                  ),
                  child: Text('Resumen',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 20,
                              spreadRadius: 20
                          )
                        ]
                    ),

                  ),

                ),


                Container(
                  margin: EdgeInsets.only(
                      top: 0,
                      left: 0
                  ),
                  height:105,

                  child: ListView(
                    scrollDirection: Axis.horizontal,

                    children: [
                      InkWell(
                        onTap: () {

                           widget.cambiar();

                        },
                        child:Container(
                          padding: EdgeInsets.only(
                              top: 8
                          ),
                          width: 170,
                          height: 80,
                          margin: EdgeInsets.only(
                              right: 20,
                              top: 10,
                              left: 20,
                              bottom: 10
                          ),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [

                                    Color.fromRGBO(67, 206, 162, 1.0),
                                    Color.fromRGBO(24, 90, 157, 1.0),
                                  ]
                              ),
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(53, 165, 129, 1.0),
                                    blurRadius: 9,
                                    spreadRadius: 1,
                                )
                              ]
                          ),
                          child: Column(

                            children: [

                              Text('Completadas',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 5
                                  ),
                                  child: Text(terminadas,
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),)
                              ),

                            ],
                          ),
                        ) ,
                      ),

                      Container(
                        padding: EdgeInsets.only(
                            top: 8
                        ),
                        width: 170,
                        height: 80,
                        margin: EdgeInsets.only(
                            right: 10,
                            top: 10,
                            left: 10,
                            bottom: 10
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [

                                  Color.fromRGBO(255, 183, 94, 1.0),
                                  Color.fromRGBO(237, 143, 3, 1.0),
                                ]
                            ),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(255, 183, 94, 1.0),
                                blurRadius: 9,
                                spreadRadius: 1,
                              )
                            ]
                        ),
                        child: Column(

                          children: [

                            Text('Pendientes',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),),
                            Container(
                                margin: EdgeInsets.only(
                                    top: 5
                                ),
                                child: Text(pendientes,
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),)
                            ),

                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 8
                        ),
                        width: 170,
                        height: 80,
                        margin: EdgeInsets.only(
                            right: 10,
                            top: 10,
                            left: 10,
                            bottom: 10
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [

                                  Color.fromRGBO(229, 57, 53, 1.0),
                                  Color.fromRGBO(227, 93, 91, 1.0),
                                ]
                            ),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(227, 93, 91, 1.0),
                                blurRadius: 9,
                                spreadRadius: 1,
                              )
                            ]
                        ),
                        child: Column(

                          children: [

                            Text('Vencidas',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),),
                            Container(
                                margin: EdgeInsets.only(
                                    top: 5
                                ),
                                child: Text(vencidas,
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),)
                            ),

                          ],
                        ),
                      ),


                    ],
                  ),
                ),

              ],

            ),

          ),
            flex: 6,
          ),
          Expanded(child:
          Container(
            margin: EdgeInsets.only(top: 0,),
            child:ListView.builder(
              itemCount: tareas.length,
              itemBuilder: (context, index) {
                var tarea = tareas.elementAt(index);
                var titulo = tarea.titulo;
                var tarjeta = CardTarea(tarea.id!,tarea.titulo,tarea.descripcion,tarea.fecha,(DateTime.now().isAfter(DateTime.parse(tarea.fecha!))?true:false),tarea.status,refresh);

                return tarjeta;

              },
          ),),

            flex: 11,
          )
        ],
      ),);


  }

}