// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home_section/empty_note_home_screen.dart';
import 'package:to_do_app/screens/login/login_screen.dart';
import 'package:to_do_app/widgets/app_bar_icon_widget.dart';

class ResetNewPasswordScreen extends StatefulWidget {
  const ResetNewPasswordScreen({super.key});

  @override
  State<ResetNewPasswordScreen> createState() => _ResetNewPasswordScreenState();
}

class _ResetNewPasswordScreenState extends State<ResetNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(leading: AppBarIcons(),),
      body: Center(
        child: Column(children: [
          SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 28),
                  child: Text(
                    'Reset new Password',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 160, ),
                  child: Text('Set a new password'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                     width: 301,
                     height: 48,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: '************',
                          suffixIcon: Image.asset(
                            height: 16.84,
                            width: 17.1,
                            'assets/images/password_hide_eye_icon.png'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
                  SizedBox(
                  width: 301,
                  height: 48,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Password Sample',
                        suffixIcon: Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Spacer(),
                 Padding(
                   padding: const EdgeInsets.all(50),
                   child: ElevatedButton(
                                 style: ElevatedButton.styleFrom(
                                   backgroundColor: Color(0xff6F24E9),
                                   fixedSize: Size(327, 48),
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                                 ),
                                 onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                                 }, child: Text('continue',style: TextStyle(color: Colors.white),)),
                 ),
        ],),
      ),
    );
  }
}