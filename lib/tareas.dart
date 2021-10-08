
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'tarea.dart';
class Tareas extends StatefulWidget {
  const Tareas({Key? key}) : super(key: key);

  @override
  _TareasState createState() => _TareasState();
}

class _TareasState extends State<Tareas> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    Container(
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
                                color: Colors.black12,
                                blurRadius: 6,
                                spreadRadius: 5
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
                              child: Text('5',
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

                                Color.fromRGBO(255, 183, 94, 1.0),
                                Color.fromRGBO(237, 143, 3, 1.0),
                              ]
                          ),
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                spreadRadius: 5
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
                              child: Text('5',
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
                                color: Colors.black12,
                                blurRadius: 6,
                                spreadRadius: 5
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
                              child: Text('5',
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
          flex: 4,
        ),
        Expanded(child:
        Container(
          margin: EdgeInsets.only(top: 0),
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
          flex: 6,
        ),




      ],
    )
      ;
  }
}
