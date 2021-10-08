import 'package:flutter/material.dart';

class TareaForm extends StatefulWidget {
  const TareaForm({Key? key}) : super(key: key);

  @override
  _TareaFormState createState() => _TareaFormState();
}

class _TareaFormState extends State<TareaForm> {


  var fechaSeleccionada=DateTime.now();
  var fecha=DateTime.now().toString();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: this.fechaSeleccionada,
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030)),
    dateTime
    ;

    if (picked != null) {
      setState(() {
        this.fechaSeleccionada=picked;
        this.fecha=this.fechaSeleccionada.toString();
      });

    }
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    this.fecha=this.fechaSeleccionada.toString();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:
            Stack(

              children: [
                Container(
                  margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(235, 250, 244, 1.0),
                            Color.fromRGBO(255,255 ,255, 1)
                          ]
                      )
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(
                      top: 60,
                      left: 25,
                      right: 25,
                      bottom: 60
                  ),
                  padding: EdgeInsets.only(

                    left: 20,
                    right: 20,

                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 8,
                            blurRadius: 10,
                        )
                      ],

                  ),
                  child:

                  ListView(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(
                          bottom: 20
                        ),
                        child: InkWell(
                          child: Icon(Icons.arrow_back_ios_new),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),

                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(
                            bottom: 10
                        ),
                        child: Text('Nueva Tarea',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 20,
                            left: 0,
                            right: 0
                        ),

                        decoration: BoxDecoration(
                            color: Color.fromRGBO(20, 20, 100, .05),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              focusColor: Color.fromRGBO(147, 37, 255, 0),
                              focusedBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(147, 37, 255, 0),
                                      width: 0

                                  )) ,

                              label:Text.rich(
                                  TextSpan(


                                      children: <InlineSpan>[
                                        WidgetSpan(
                                          child: Text(

                                            'Titulo',
                                            style: TextStyle(
                                                color: Color.fromRGBO(106, 106, 106, 0.8666666666666667),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15
                                            ),
                                          ),
                                        ),
                                      ])),

                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 0,
                                      color: Color.fromRGBO(0, 0, 0, 0.1)
                                  )
                              )
                          ),
                        ),
                      ),




                      Container(
                        margin: EdgeInsets.only(
                            top: 20,
                            left: 0,
                            right: 0
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(20, 20, 100, .05),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: TextField(
                          maxLines: 10,
                          decoration: InputDecoration(
                              focusColor: Color.fromRGBO(147, 37, 255, 0.2),
                              focusedBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(20, 20, 100, .05),
                                      width: 0

                                  )) ,
                              label:Text.rich(
                                  TextSpan(
                                      children: <InlineSpan>[
                                        WidgetSpan(
                                          child: Text(
                                            'Descripcion',
                                            style: TextStyle(
                                                color: Color.fromRGBO(106, 106, 106, 0.8666666666666667),
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ),
                                      ])),

                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 0,
                                      color: Color.fromRGBO(147, 37, 255, 0.2)
                                  )
                              )
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            _selectDate(context);
                          },

                          child:Container(
                              margin: EdgeInsets.only(
                                  left: 0,
                                  top:10,
                                  right: 0
                              ),
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(20, 20, 100, .05),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child:Row(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: double.infinity,
                                      margin: EdgeInsets.only(
                                          left: 5
                                      ),
                                      child: Icon(Icons.alarm,
                                        color: Color.fromRGBO(28, 205, 124, 1.0),
                                        size: 35,),
                                    ),
                                  ),
                                  Expanded(
                                      flex:9,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 20
                                        ),
                                        height: double.infinity,
                                        alignment: Alignment.centerLeft,
                                        child: Text(fecha),
                                      ))
                                ],
                              ))

                      ),
                      Container(
                          margin: EdgeInsets.only(
                              right: 20,
                              top: 80
                          ),
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {

                            },
                            child: Icon(Icons.description,
                              size: 40,),
                            style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                                primary: Color.fromRGBO(28, 205, 124, 1.0)
                            ),
                          )
                      )



                    ],
                  ),

            )]))
        ;
  }
}
