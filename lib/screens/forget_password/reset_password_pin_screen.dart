// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/screens/forget_password/reset_new_password_screen.dart';
import 'package:to_do_app/widgets/app_bar_icon_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetPasswordGetPinCode extends StatefulWidget {
  const ResetPasswordGetPinCode({super.key});

  @override
  State<ResetPasswordGetPinCode> createState() => _ResetPasswordGetPinCodeState();
}

class _ResetPasswordGetPinCodeState extends State<ResetPasswordGetPinCode> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(leading: AppBarIcons(),),
      body: Center(
        child: Column(children: [
          SizedBox(height: 30,),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Padding(
                  padding: const EdgeInsets.only(right: 85, bottom: 28),
                  child: Text(
                    'Reset new Password',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text(' A verification code has been sent to\n uni xxxx @gmail.com'),
                ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text('Enter Verification code '),
               ),
               ],),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: PinCodeTextField(
                     pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 45.36,
                        fieldWidth: 43.55,
                        inactiveColor: Colors.grey
                      ),
                    appContext: context, length: 6),
                ),
                Text('Didn’t receive OTP Code? '),
                Text('Resend Code'),
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
                                    Navigator.push(context, MaterialPageRoute(builder: (_)=>ResetNewPasswordScreen()));
                                 }, child: Text('continue',style: TextStyle(color: Colors.white),)),
                 ),
        ],),
      ),
    );
  }
}