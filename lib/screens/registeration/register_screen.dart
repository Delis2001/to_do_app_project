// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home_section/bottom_nav.dart';
import 'package:to_do_app/screens/home_section/empty_note_home_screen.dart';
import 'package:to_do_app/screens/login/login_screen.dart';
import 'package:to_do_app/widgets/app_bar_icon_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
  @override
  Widget build(BuildContext context) {
     final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()..onTap = (){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginScreen()));
  };
    return Scaffold(
      appBar: AppBar(
        leading: AppBarIcon(),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 28),
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Text('Username'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13, bottom: 18),
                child: SizedBox(
                  width: 327,
                  height: 48,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter your Username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Text('Password'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13, bottom: 10),
                child: SizedBox(
                  width: 327,
                  height: 48,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: '**********',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              ),
                            Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Text('Comfirm password'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13, bottom: 18),
                child: SizedBox(
                  width: 327,
                  height: 48,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: '************',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 15,),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff6F24E9),
                      fixedSize: Size(327, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> BottomNavBar()));
                  },
                  child: Text(
                    'REGISTER',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,),
                child: Image.asset('assets/images/vector.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('OR'),
              ),
              Image.asset('assets/images/vector.png'),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(327, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),side: BorderSide())),
                onPressed: () {},
                icon:Image.asset(
                  height: 24,
                  width: 24,
                  'assets/images/icon.jpg'),
                label: Text(
                  'Login with Google',
                  style: TextStyle(color: Colors.black),
                )),
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(327, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),side: BorderSide())),
              onPressed: () {},
              icon: Icon(
                Icons.apple,
                color: Colors.black,size: 29,
              ),
              label: Text(
                'Login with Apple',
                style: TextStyle(color: Colors.black),
              )),
              Spacer(),
              SizedBox(height: 35),
              RichText(text: TextSpan(text: 'Already have an account? ',style: TextStyle(color: Colors.black),children: [
                TextSpan(text: 'Login',style: TextStyle(color: Color(0xff6F24E9)),recognizer: _gestureRecognizer )
              ])),
              SizedBox(
                height: 40,
              )
        ],
      ),
    );
  }
}