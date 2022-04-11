
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:worldtime/services/time.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setworld() async{
    World_Time i=World_Time(location: "kolkata", url: "Asia/Kolkata", flag: "india");

    await i.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
     'location':i.location,
     'url':i.url,
    'times':i.times,

     'flag':i.flag,
    'daynight':i.daynight,

    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setworld();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body:SafeArea(
        child: Center(
            child:CircularProgressIndicator(


           )
         ),
      ),
    );
  }
}

    