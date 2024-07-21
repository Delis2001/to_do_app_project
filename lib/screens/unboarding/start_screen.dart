// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/screens/login/login_screen.dart';
import 'package:to_do_app/screens/registeration/register_screen.dart';
import 'package:to_do_app/widgets/app_bar_icon_widget.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarIcon()
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40,bottom: 10),
              child: Text('Welcome to ToDo',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
            ),
            Text('Please login to your account or create',),
            Text(' new account to continue'),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff6F24E9),
                fixedSize: Size(327, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
              ),
              onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
              }, child: Text('LOGIN',style: TextStyle(color: Colors.white),)),
            Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: Size(327, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  side: BorderSide()
                ),
                onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>RegisterScreen()));
                }, child: Text('CREATE ACCOUNT',style: TextStyle(color: Colors.black),)),
            )
          ],
        ),
      ),
    );
  }
}
