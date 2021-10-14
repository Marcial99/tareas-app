import 'package:flutter/material.dart';
import 'package:tareas_practica/database/database_helper_tarea.dart';
import 'package:tareas_practica/models/tarea_model.dart';

class EditTarea extends StatefulWidget {
  TareaModel _tareaModel;
  EditTarea(this._tareaModel);

  @override
  _EditTareaState createState() => _EditTareaState(this._tareaModel);
}

class _EditTareaState extends State<EditTarea> {
  TareaModel _tareaModel;
  _EditTareaState(this._tareaModel);

  late DatabaseHelperTarea _databaseHelperTarea;

  var fechaSeleccionada=DateTime.now();
  var fecha=DateTime.now().toString();
  TextEditingController _controllerTitulo = TextEditingController();
  TextEditingController _controllerDescripcion = TextEditingController();



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: this.fechaSeleccionada,
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030)),
        dateTime
    ;
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute),
    );
    if (picked != null) {
      if(time != null){
        setState(() {
          this.fechaSeleccionada=picked;
          this.fechaSeleccionada = new DateTime(this.fechaSeleccionada.year,this.fechaSeleccionada.month,this.fechaSeleccionada.day,time.hour,time.minute);
          this.fecha = this.fechaSeleccionada.toIso8601String();
        });

      }else {
        setState(() {
          this.fechaSeleccionada = picked;
          this.fecha = this.fechaSeleccionada.toIso8601String();
        });
      }
    }
  }



  guardar(){
    if(_controllerTitulo.text !='' && _controllerDescripcion.text!=''){
      try {
        var tarea = TareaModel(
          id: this._tareaModel.id,
            titulo: _controllerTitulo.text,
            descripcion: _controllerDescripcion.text,
            fecha: this.fecha,
          status: this._tareaModel.status
        );
        _databaseHelperTarea.update(tarea.toMap()).then((result) {
          if (result > 0) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Tarea actualizada correctamente')));
            Navigator.pop(context);
            Navigator.pushNamed(context, '/home');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('La solicitud no se completo')));
          }
        });
      }catch(Exception){
        print(Exception);
      }


    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fecha=this._tareaModel.fecha!;
    this._databaseHelperTarea = DatabaseHelperTarea();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _databaseHelperTarea.getTarea(this._tareaModel.id!),
      builder: (BuildContext context,AsyncSnapshot<TareaModel> snapshot) {
        if (snapshot.hasError){
          return Center(
            child: Text('Ocurrio un error en la peticion'),
          );
        }else{
          if (snapshot.connectionState == ConnectionState.done){
            _controllerTitulo.text=this._tareaModel.titulo!;
            _controllerDescripcion.text=this._tareaModel.descripcion!;


            return _editTareas(snapshot.data!);
          }else{
            return Center(
              child:CircularProgressIndicator(),
            );
          }
        }

      },
    );


  }
  Widget _editTareas(TareaModel tarea){
    return Scaffold(
        body:
        Stack(

            children: [
              Container(
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(67, 206, 162, 1.0),
                          Color.fromRGBO(24, 90, 157, 1.0),
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
                        controller: _controllerTitulo,
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
                        controller: _controllerDescripcion,

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
                                      child: Text(this.fecha),
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
                            guardar();
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
