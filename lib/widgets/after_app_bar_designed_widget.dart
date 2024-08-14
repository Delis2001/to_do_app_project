// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/posts_and_edith_to_do/create_notes_screen.dart';

class AfterAppBarUiDesignedWidget extends StatefulWidget {
 final VoidCallback onTap;
 final VoidCallback secondOnTap;
  Color? containerColor1;
  Color?  containerColor2;
  String? firstTitle;
  String? secondeTitle;
  AfterAppBarUiDesignedWidget({super.key,required this.onTap, this. containerColor1,this.containerColor2,this.firstTitle,this.secondeTitle,required this.secondOnTap});

  @override
  State<AfterAppBarUiDesignedWidget> createState() => _UnderAppBarDesignedUiWidgetState();
}

class _UnderAppBarDesignedUiWidgetState extends State<AfterAppBarUiDesignedWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
           Padding(
             padding: const EdgeInsets.only(top: 30),
             child: Image.asset('assets/images/vector4.png'),
           ),
          Row(children: [
             Padding(
               padding: const EdgeInsets.all(18),
               child: GestureDetector(onTap:widget.onTap,
                 child: Container(
                           width: 85,
                           height: 18,
                          decoration: BoxDecoration(
                color:widget. containerColor1,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text(widget.firstTitle!,style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
               ),
               ),
             ),
            GestureDetector(onTap:widget.secondOnTap,
              child: Container(
              width: 85,
              height: 18,
              decoration: BoxDecoration(
                color:widget. containerColor2,
                borderRadius: BorderRadius.circular(5)
              ),
                 child: Text(widget.secondeTitle!,style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                       ),
            ),
            Spacer(),
            IconButton(onPressed: (){}, icon: ImageIcon(Image.asset('assets/images/tag.png',color: Color(0xff6F24E9),).image)),
            Text('category',style: TextStyle(fontWeight: FontWeight.bold),),
              IconButton(onPressed: (){
                 showDialog(context: context, builder: (context) => SimpleDialog(
                  title:  ListTile(
                     leading:   Image.asset(
                     color:  Color(0xff6F24E9),
                     'assets/images/tag.png',),title:  Text('all categories',style: TextStyle(color:Color(0xff6F24E9) )),),
                    children: [
                      ListTile(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNotesScreen(),));
                   },
                   leading: Icon(Icons.add,color: Color(0xff6F24E9),),title: Text('new category',style:TextStyle(color: Color(0xff6F24E9)),),)
              ],),);
              }, icon: Icon(Icons.keyboard_arrow_down_rounded,color: Color(0xff6F24E9),))
          ],),
            Image.asset('assets/images/vector4.png'),
               
          ],);
  }
}