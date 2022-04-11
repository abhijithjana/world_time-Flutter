import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map data={};
  late String day;


  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty?data:ModalRoute.of(context)!.settings.arguments as Map ;
    day=data['daynight']?'day.png':'night.png';


    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/$day'),
          fit: BoxFit.cover
    ),
        ),
    child:Center(
              child:Column(

                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0, 120, 0, 0),),
                  SizedBox(
                    height: 60.0,
                  ),
                  FlatButton.icon(
                      onPressed: () async{
                        dynamic result=await Navigator.pushNamed(context, '/editpage');

                        if(result!=null){
                         setState(() {
                           data={
                             'times':result['times'],
                             'daynight':result['daynight'],
                             'location':result['location'],
                           };
                         });
    }
                      },
                      label: Text('go to edit menu',style: TextStyle(
                        color: Colors.grey
                      ),),
                      icon: Icon(Icons.edit_location,
                      color: Colors.grey,)
                  ),
                  Text(data['location'],style: TextStyle(
                      fontSize: 30.0,
                    color: Colors.white70
                  ),),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(data["times"],style: TextStyle(
                      fontSize: 70.0,
                      fontWeight: FontWeight.w700,
                    color: Colors.white70
                  ),)
                ],
              )

          )

    ),


      );

  }
}
