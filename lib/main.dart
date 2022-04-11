import 'package:flutter/material.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/edittime.dart';
import 'package:worldtime/pages/loading.dart';

void main(){
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>Loading(),
        '/home':(context)=>Home(),
        '/editpage':(context) => Edit(),
      },
    )
  );
}


