// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_cast, unused_import



import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/screens/forget_password/reset_password.dart';
import 'package:to_do_app/screens/home_section/bottom_nav.dart';
import 'package:to_do_app/screens/home_section/empty_note_home_screen.dart';
import 'package:to_do_app/screens/registeration/register_screen.dart';
import 'package:to_do_app/widgets/app_bar_icon_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 
  @override
  Widget build(BuildContext context) {
     final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()..onTap = (){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> RegisterScreen()));
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
                  'Login',
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
              )
            ],
          ),
          SizedBox(
            height: 50,
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
                    'LOGIN',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          SizedBox(height: 50,),
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
              SizedBox(height: 2),
              GestureDetector(
                onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (_)=> ResetPasswordEmail()));
                },
                child: Text('Reset your password',style: TextStyle(color: Colors.red),)),
              RichText(text: TextSpan(text: 'Don’t have an account? ',style: TextStyle(color: Colors.black),children: [
                TextSpan(text: 'Register',style: TextStyle(color: Color(0xff6F24E9)),recognizer: _gestureRecognizer )
              ])),
              SizedBox(
                height: 40,
              )
        ],
      ),
    );
  }
}
