import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class World_Time{
  late String location;
  late String url;
  late String times;
  late String flag;
  late  String datetime;
  late int sec;
  late bool daynight;
  World_Time({required this.location,required this.url,required this.flag});

  Future<void> getTime() async{
    try{
      Response respose= await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data= jsonDecode(respose.body);
      print("data: $data");


      String datetime=data['datetime'];
      String time_offset=data['utc_offset'].substring(1,3);

      String time_offsetmin =data['utc_offset'].substring(4,6);

      DateTime now =DateTime.parse(datetime);

      now=now.add(Duration(hours: int.parse(time_offset),minutes: int.parse(time_offsetmin)));
      daynight=now.hour >=6 && now.hour<=18 ? true: false;
        sec=now.second.toInt();
      times=DateFormat.jm().format(now);
   print("time: $sec");

    }
    catch(e){
      times="failed to load $e";
    }
  }

}




