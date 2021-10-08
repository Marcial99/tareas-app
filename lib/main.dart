import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tareas_practica/tareas_terminadas.dart';
import 'tarea.dart';
import 'tareas.dart';
import 'tarea_detail.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/nueva':(BuildContext context)=> TareaForm(),
        '/home':(BuildContext context)=> MyApp(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        brightness: Brightness.light,

      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,

      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int indexPage=0;
  cambiarPagina(int index){
    setState(() {
      this.indexPage=index;
    });

  }

  _tareas(){

      if(this.indexPage==0){
        return Tareas();
      }
      else if(this.indexPage==1){
        return TareasTerminadas();
      }else if(this.indexPage==2){
        return TareaForm();
      }


  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
              Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: _tareas(),


                // This trailing comma makes auto-formatting nicer for build methods.
              )
            ],
          )
      ,

    bottomNavigationBar:
        Stack(
          alignment: Alignment.topCenter,
          children: [

            Container(
            padding: EdgeInsets.only(
                left: 0,
                top: 10,
                bottom: 0
            ),
            margin: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 10
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(21, 203, 123, 1.0),
                      Color.fromRGBO(7, 182, 176, 1),
                    ],
                    begin: FractionalOffset(0,0),
                    end: FractionalOffset(1,0),
                    tileMode: TileMode.clamp
                ),
                borderRadius: BorderRadius.circular(20)
            ),
            child:BottomNavigationBar(
              onTap: (value) {
                cambiarPagina(value);
              },
              currentIndex: this.indexPage,


              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.book,

                    size: 35,),
                  label: '',

                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check,

                      size: 35,),
                    label: ''
                ),

              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedFontSize: 14,
              unselectedFontSize: 13,
              unselectedItemColor: Colors.white60,
              selectedItemColor: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),


                Container(
                  margin: EdgeInsets.only(
                    top: 5
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                      Navigator.pushNamed(context, '/nueva');
                    },
                    child: Icon(Icons.add,
                      color: Color.fromRGBO(28, 205, 124, 1.0),
                      size: 40,),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10),
                        primary: Color.fromRGBO(255, 255, 255, 0.6509803921568628),
                        elevation: 10
                    ),
                  ),
                ),




          ],
        ),


    );
  }
}
