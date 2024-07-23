// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class CreateNotesScreen extends StatefulWidget {
 
  const CreateNotesScreen({super.key});

  @override
  State<CreateNotesScreen> createState() => _CreateNotesScreenState();
}

class _CreateNotesScreenState extends State<CreateNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back)),
        title: Text('Notes'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset('assets/images/vector3.png',color: Color(0xff6F24E9),),
          ),
          Icon(Icons.delete_forever_outlined,color: Color(0xff6F24E9),),
        ],
      ),
      body: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Text('Title'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: TextField(
            cursorColor: Color(0xff6F24E9),
            enabled: true,
            enableSuggestions: true,
            showCursor: true,

            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
            border: UnderlineInputBorder(borderSide: BorderSide.none)
            
            ),
          ),
        ),
        Spacer(),
        Row(children: [ IconButton(onPressed: (){}, icon: Image.asset('assets/images/tag.png',color: Color(0xff6F24E9),)),
            Text('category',style: TextStyle(fontWeight: FontWeight.bold),),
              IconButton(onPressed: (){
             showDialog(context: context, builder: (context) => SimpleDialog(
                children: [
                Column(children: [
                  ListTile(
                    onTap: () {
                      showDialog(context: context, builder: (context) => SimpleDialog(children: [
                      ListTile(leading:   Image.asset(
                        color:  Color(0xff6F24E9),
                        'assets/images/tag.png',),title:  Text('all categories',style: TextStyle(color:Color(0xff6F24E9) )),),
                      ListTile(leading:   Image.asset('assets/images/tag.png',),title: Text('Kodex'),), 
                       ListTile(leading:   Image.asset('assets/images/tag.png',),title: Text('Webstack'),),
                        ListTile(leading:   Image.asset('assets/images/tag.png',),title: Text('Univyerse'),),
                         ListTile(leading:  Image.asset('assets/images/tag.png',),title: Text('Lorem Iposum'),),
                    ListTile(leading:   Image.asset('assets/images/tag.png',),title: Text('Nunc ac'),),
                     ListTile(leading: Icon(Icons.add,color: Color(0xff6F24E9),),title: Text('new category',style:TextStyle(color: Color(0xff6F24E9)),),)
                      ],),);
                    },
                    leading:  Image.asset('assets/images/tag.png',color: Color(0xff6F24E9),),title:  Text('all categories',style: TextStyle(color: Color(0xff6F24E9)),)),
                   ListTile(leading: Icon(Icons.add,color: Color(0xff6F24E9),)  ,title: Text('new category',style:TextStyle(color: Color(0xff6F24E9)),),)
                ],)
              ],),);
            
              }, icon: Icon(Icons.keyboard_arrow_up_outlined,color: Color(0xff6F24E9),))],),
      ],),),
    );
  }
}