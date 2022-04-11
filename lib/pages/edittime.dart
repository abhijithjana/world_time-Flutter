
import 'dart:collection';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/services/time.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  List<World_Time> locations = [
    World_Time(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    World_Time(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    World_Time(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    World_Time(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    World_Time(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    World_Time(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    World_Time(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    World_Time(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
void update(index) async{
 World_Time instance=locations[index];
 await instance.getTime();
 Navigator.pop(context,{
   'location':instance.location,
   'url':instance.url,
   'times':instance.times,

   'flag':instance.flag,
   'daynight':instance.daynight

 });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select location'),
        elevation: 0,
      ),
      body:ListView.builder(
          itemCount: locations.length,
          itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    update(index);
                  },
                  title: Text(locations[index].location),
                ),
              ),
            );
          }
      ),
    );
  }
}

