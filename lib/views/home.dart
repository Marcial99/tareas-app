import 'package:flutter/material.dart';
import 'package:tareas_practica/views/tarea_detail.dart';
import 'package:tareas_practica/views/tareas.dart';
import 'package:tareas_practica/views/tareas_terminadas.dart';

class Home extends StatefulWidget {
  int index;
  Home(this.index);

  @override
  _HomeState createState() => _HomeState(this.index);
}

class _HomeState extends State<Home> {
  var indexPage=0;

  _HomeState(this.indexPage);

  completadas(){
    setState(() {
      this.indexPage=1;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
        Stack(
          children: [
            Container( //GRADIENTE DEL FONDO
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(235, 250, 244, 1.0),
                    Color.fromRGBO(255, 255, 255, 1)
                  ]
                )
              ),
            ),

            Center(
              child: _vistas(),
            ),
            Positioned(


              bottom: 10,
              left: 0,
              right: 0,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [

                  Container(
                    padding: EdgeInsets.only(
                        left: 0,
                        top: 10,
                        bottom: 0
                    ),
                    margin: EdgeInsets.only(
                        left: 30,
                        right: 30,
                        bottom: 10
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(67, 206, 162, 1.0),
                              Color.fromRGBO(24, 90, 157, 1.0),
                            ],
                            begin: FractionalOffset(0,0),
                            end:FractionalOffset(1,0),
                            tileMode: TileMode.clamp
                        ),
                        borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 20,
                          spreadRadius: 2
                        )
                      ]
                    ),
                    child: BottomNavigationBar(
                      onTap: (value) {
                        cambiarPagina(value);
                      },
                      currentIndex: this.indexPage,
                      items: [
                        BottomNavigationBarItem( //ICONO DE TAREAS PENDIENTES
                            icon:Icon(Icons.book,
                                size: 35),
                            label: ''
                        ),
                        BottomNavigationBarItem(//ICONO DE TAREAS COMPLETADAS
                            icon:Icon(Icons.check,
                                size: 35),
                            label: ''
                        ),
                      ],
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      selectedFontSize: 14,
                      unselectedFontSize: 13,
                      unselectedItemColor: Colors.white60,
                      selectedItemColor: Colors.white,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        top: 5
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context,'/home');
                        Navigator.pushNamed(context, '/nueva');
                      },
                      child: Icon(Icons.add,
                        color: Color.fromRGBO(61, 61, 61, 1.0),
                        size: 40,),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                          primary: Color.fromRGBO(255, 255, 255, 0.6509803921568628),
                          elevation: 10
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],

        ),
      //MENU DE ABAJO



    );
  }

  _vistas() {
    if(this.indexPage==0){
      return Tareas(this.completadas);
    }
    else if(this.indexPage==1){
      return TareasTerminadas();
    }else if(this.indexPage==2){
      return TareaForm();
    }
  }

  void cambiarPagina(int index) {
    setState(() {
      this.indexPage=index;
    });
  }
}
