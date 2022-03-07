import 'package:flutter/material.dart';
import 'home.dart';
import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        //canvasColor:Colors.black,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 25,fontWeight: FontWeight.bold ,color: Colors.black,),
          headline2: TextStyle(fontSize: 40 , fontWeight: FontWeight.bold , color: Colors.white),
          headline3: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ,color: Colors.black,),
        ),
      ),

      home: const MyHomePage(),
    );
  }
}


