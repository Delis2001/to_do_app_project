// ignore_for_file: unnecessary_const, prefer_const_constructors, unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:to_do_app/screens/unboarding/unboarding_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () { 
      Navigator.push(context, MaterialPageRoute(builder: (_)=>IntroScreenDefault()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Image.asset(
          height:94,
          width: 95,
          'assets/images/group.png'),
         Padding(
           padding: const EdgeInsets.only(top: 15,left: 10),
           child: Image.asset(
            height:48,
            width: 95,
            'assets/images/text.png'),
         ),
      ],),),
    );
  }
}