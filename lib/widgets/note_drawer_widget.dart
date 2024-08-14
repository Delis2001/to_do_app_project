// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home_section/setting_screen.dart';

class NoteDrawerWidegt extends StatefulWidget {
  const NoteDrawerWidegt({super.key});

  @override
  State<NoteDrawerWidegt> createState() => _NoteDrawerWidegtState();
}

class _NoteDrawerWidegtState extends State<NoteDrawerWidegt> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
     width: 241,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 20),
              child: CircleAvatar(
              radius: 25,
              backgroundImage: Image.asset('assets/images/circle_avatar.png').image,),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 60,left: 15),
            child: Icon(Icons.edit,color: Color(0xff6F24E9),),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 20,right: 10),
            child:IconButton(onPressed: (){
              Navigator.of(context).pop();
            }, icon: Icon(Icons.cancel,color: Color(0xff6F24E9),size: 30,))
            )
            ],),
           ListTile(leading: Text('Username',style: TextStyle(fontSize: 16),),title: Padding(
             padding: const EdgeInsets.only(right: 80),
             child: Icon(Icons.edit,color: Color(0xff6F24E9),),
           ),),
           Padding(
             padding: const EdgeInsets.only(left: 15),
             child: Text('Email',style: TextStyle(fontSize: 16),),
           ),
           Spacer(),
           ListTile(
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingScreen()));
            },
            leading: Icon(Icons.settings,color: Color(0xff6F24E9),),title: Text('Settings'),),
           ListTile(leading: Icon(Icons.logout,color: Color(0xff6F24E9),),title: Text('Logout'),)
        ],),
       shape: ShapeBorder.lerp(LinearBorder(), LinearBorder(),BorderSide.strokeAlignInside),
      );
  }
}