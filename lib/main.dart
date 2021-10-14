import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tareas_practica/views/home.dart';
import 'package:tareas_practica/views/tarea_detail.dart';
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
        '/home':(BuildContext context)=> Home(0),

      },
      title: 'Flutter Demo',
      theme: ThemeData(
              brightness: Brightness.light,

      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,

      home: Home(0),
    );
  }
}
