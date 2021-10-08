import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardTarea extends StatefulWidget {
  const CardTarea({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<CardTarea> {


  bool completado=false;

  completar(bool? estado){
    setState(() {
      this.completado=estado!;
    });

  }

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        splashColor: Colors.purple,
        onTap: () {
          print('hola');
        },
        child:Container(

          margin: EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
              bottom: 5
          ),
          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(212, 212, 212, 0.6392156862745098),
                    blurRadius: 5,
                    spreadRadius: 3,
                    offset: Offset(0, 5)
                )
              ],
                  gradient: LinearGradient(
                  colors: [
                    (this.completado)?Color.fromRGBO(21, 203, 123, 1.0):Colors.white,
                    (this.completado)?Color.fromRGBO(7, 182, 176, 1):Colors.white,
              ],
              begin: FractionalOffset(0,0),
            end: FractionalOffset(1,0),
            tileMode: TileMode.clamp
        )

),
          child:

          Row(children: [
            Expanded(
              flex: 1,
              child: Checkbox(value: this.completado, onChanged: (value) {
                completar(value);
              },
              shape: CircleBorder(),
              )
              ,),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 5,
                        top: 15
                    ),

                    child: Text('Titulo',
                      style: TextStyle(
                          color: (this.completado)?Colors.white:Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 5,
                        top: 15
                    ),
                    child: Text('Fecha',
                      style: TextStyle(
                          color: (this.completado)?Colors.white:Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 5,
                        top: 15,
                        bottom: 15
                    ),
                    child: Text('Realizada',
                      style: TextStyle(
                          color: (this.completado)?Colors.white:Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                      ),
                    ),
                  ),

                ],
              ),),
            Expanded(
                flex: 2,
                child:
                IconButton(
                  icon: Icon(Icons.visibility_off_outlined,
                    color: Colors.red,),
                  onPressed: () {

                  },
                )
            ),




          ],),


        ) ,
      )
      ;
  }
}

