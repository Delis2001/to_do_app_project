// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_app/screens/forget_password/reset_password_pin_screen.dart';
import 'package:to_do_app/widgets/app_bar_icon_widget.dart';

class ResetPasswordEmail extends StatefulWidget {
  const ResetPasswordEmail({super.key});

  @override
  State<ResetPasswordEmail> createState() => _ResetPasswordEmailState();
}

class _ResetPasswordEmailState extends State<ResetPasswordEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: const EdgeInsets.only(right: 130, bottom: 10),
                  child: Text('Enter your Email Address'),
                ),
                SizedBox(
                  width: 301,
                  height: 48,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: '@gmail.com',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:60,top: 8),
                  child: Text('A verification number will be sent to\n your Email Address'),
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
                                    Navigator.push(context, MaterialPageRoute(builder: (_)=>ResetPasswordGetPinCode()));
                                 }, child: Text('continue',style: TextStyle(color: Colors.white),)),
                 ),
        ],),
      ),
    );
  }
}