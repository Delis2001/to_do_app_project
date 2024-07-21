import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon:Icon(Icons.arrow_back,size: 40,),),
        title: Text('Settings',style: TextStyle(fontSize: 40),),
      ),
      body: Center(child: Column(children: [
       ListTile(leading:Icon(Icons.key_sharp,color: Color(0xff6F24E9),) ,title: Text('Update Password'),trailing: Icon(Icons.arrow_forward_ios_outlined),),
       ListTile(leading:Icon(Icons.person_2_rounded,color: Color(0xff6F24E9),) ,title: Text('Change Username'),trailing: Icon(Icons.arrow_forward_ios_outlined),),
        ListTile(leading:Icon(Icons.delete_forever_outlined,color: Color(0xff6F24E9),) ,title: Text('Delete Account'),trailing: Icon(Icons.arrow_forward_ios_outlined),),
         ListTile(leading:Icon(Icons.settings,color: Color(0xff6F24E9),) ,title: Text('Dark Mode'),trailing: Switch(value: true, onChanged:(bool){} ,)),
      ],),),
    );
  }
}