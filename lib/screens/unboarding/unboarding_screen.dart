// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:to_do_app/screens/unboarding/start_screen.dart';

class IntroScreenDefault extends StatefulWidget {
  const IntroScreenDefault({super.key});

  @override
  State<IntroScreenDefault> createState() => _IntroScreenDefault();
}

class _IntroScreenDefault extends State<IntroScreenDefault> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (_)=>StartScreen()));
      }, icon: Text('SKIP', style: TextStyle(fontWeight: FontWeight.bold),)),),
      body: Center(child: Column(children: [
       SizedBox(
        height: MediaQuery.of(context).size.height*0.90,
         child: IntroductionScreen(
                 pages: [
          PageViewModel(
            title: "",
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,   
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 205),
                  child: Image.asset('assets/images/nav.png')
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    'Manage your Todos',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: RichText(textAlign: TextAlign.center,text: TextSpan(text:  'You can easily manage all of your daily ',style: TextStyle(color: Colors.black,fontSize: 16),children: [
                    TextSpan(text: '\n todos and notes in ',style: TextStyle(color:Colors.black,fontSize: 16),children: [
                      TextSpan(text: ' ToDO ',style: TextStyle(color:  Color(0xff6F24E9),fontSize: 16),children: [
                        TextSpan(text: 'for free',style: TextStyle(color:Colors.black,fontSize: 16))
                      ])
                    ])
                  ]),)
                ),
              ],
            ),
            decoration: PageDecoration(
              bodyAlignment: Alignment.center,
            ),
          ),
          PageViewModel(
               image: Image.asset(
                height: 296,
                width: 271,
                'assets/images/frame.png'),
            titleWidget:   Image.asset('assets/images/nav.png'),
              bodyWidget: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Create daily routine',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: RichText(textAlign: TextAlign.center,text: TextSpan(text: 'In',style: TextStyle(color: Colors.black,fontSize: 16),children: [
                    TextSpan(text: ' ToDO ',style: TextStyle(color: Color(0xff6F24E9),fontSize: 16),children: [
                      TextSpan(text: 'you can create your personalized routine to stay productive',style: TextStyle(color: Colors.black,fontSize: 16))
                    ])
                  ]),),
                ),
                  SizedBox(height: 90,)
              ],
            ),
            decoration: PageDecoration(
              bodyAlignment: Alignment.center,
            ),
          ),
          PageViewModel(
             image: Image.asset('assets/images/frame2.png'),
           titleWidget: Image.asset('assets/images/nav.png'),
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Text(
                  'Orgonaize your ToDOs',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child:RichText(textAlign: TextAlign.center,text: TextSpan(text:  'You can organize your ',style: TextStyle(color: Colors.black,fontSize: 16),children: [
                    TextSpan(text: 'ToDOs ',style: TextStyle(color: Color(0xff6F24E9),fontSize: 16),children: [
                      TextSpan(text: 'by adding\n your tasks into separate categories',style: TextStyle(color: Colors.black,fontSize: 16))
                    ])
                  ]))
                ),
                SizedBox(height: 100,)
              ],
            ),
            decoration: PageDecoration(
              bodyAlignment: Alignment.center,
            ),
          ),
                 ],
                 onDone: () {
         Navigator.push(context, MaterialPageRoute(builder: (_)=>StartScreen()));
                 },
                 showSkipButton: false,
                 skip: Text('SKIP', style: TextStyle(color: Colors.black)),
                   showBackButton: true,
                   back: Text('BACK',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                 next: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color:Color(0xff6F24E9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text('NEXT', style: TextStyle(color: Colors.white, fontSize: 16)),
                 ),
                 done: Container(
                  padding: EdgeInsets.only(top: 10,left: 10),
                  height: 40,
                  width: 150,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff6F24E9),
                 ),
                 child: Text('GET STARTED',style: TextStyle(color: Colors.white, fontSize: 12,fontWeight:  FontWeight.bold)),
                 ),
                 dotsContainerDecorator: BoxDecoration(color: Colors.transparent),
                 dotsDecorator: DotsDecorator(),
                customProgress: Container(),
            ),
       )
      ],),),
    );
  }
}
 