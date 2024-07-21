// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unnecessary_import, sort_child_properties_last

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/screens/home_section/my_note_screen.dart';
import 'package:to_do_app/screens/home_section/setting_screen.dart';
import 'package:to_do_app/screens/home_section/share_note_screen.dart';

class EmptyNoteHomeScreen extends StatefulWidget {
  const EmptyNoteHomeScreen({super.key});

  @override
  State<EmptyNoteHomeScreen> createState() => _EmptyNoteHomeScreenState();
}

class _EmptyNoteHomeScreenState extends State<EmptyNoteHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // for search bar
   bool _isTextFieldVisible = false;
  final  _focusNode = FocusNode();
  void _toggleTextFieldVisibility(){
    setState(() {
      _isTextFieldVisible = ! _isTextFieldVisible;
      if(_isTextFieldVisible){
        _focusNode.requestFocus();
      }else{
        _focusNode.unfocus();
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener( _focusNodeChange);
  }
  void _focusNodeChange(){
    if(! _focusNode.hasFocus){
      setState(() {
        _isTextFieldVisible = false;
      });
    }
  }
  // For The Shared Notes and MyNotes
  int _selectedIndex = -1;
  void _onContainerTap(int index){
    setState(() {
      _selectedIndex = index;
    });
    if(index == 0){
       Navigator.push(context, MaterialPageRoute(builder:(_)=> MyNoteScreen(index: index) ));
    }else if(index == 1){
  Navigator.push(context, MaterialPageRoute(builder:(_)=> SharedNotesScreen(index: index) ));
    }
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
     width: 241,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 20),
              child: CircleAvatar(
              radius: 30,
              backgroundImage: Image.asset('assets/images/circle_avatar.png').image,),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 60,left: 15),
            child: Icon(Icons.edit,color: Color(0xff6F24E9),),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 20,right: 10),
            child:IconButton(onPressed: (){
              Navigator.of(context).pop();
            }, icon: Icon(Icons.cancel,color: Color(0xff6F24E9),size: 30,))
            )
            ],),
           ListTile(leading: Text('Username',style: TextStyle(fontSize: 16),),title: Padding(
             padding: const EdgeInsets.only(right: 80),
             child: Icon(Icons.edit,color: Color(0xff6F24E9),),
           ),),
           Padding(
             padding: const EdgeInsets.only(left: 15),
             child: Text('Email',style: TextStyle(fontSize: 16),),
           ),
           Spacer(),
           ListTile(
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingScreen()));
            },
            leading: Icon(Icons.settings,color: Color(0xff6F24E9),),title: Text('Settings'),),
           ListTile(leading: Icon(Icons.logout,color: Color(0xff6F24E9),),title: Text('Logout'),)
        ],),
       shape: ShapeBorder.lerp(LinearBorder(), LinearBorder(),BorderSide.strokeAlignInside),
      ),
     appBar: AppBar(
      automaticallyImplyLeading: false,
      title: GestureDetector(onTap: () {
      _scaffoldKey.currentState?.openDrawer();
      },
        child: CircleAvatar(
          radius: 30,
          backgroundImage: Image.asset('assets/images/circle_avatar.png').image,),
      ),
      actions: [
      Stack(
        
        fit: StackFit.passthrough,
        alignment: Alignment.bottomLeft,
        children: [
          IconButton(onPressed: (){
        _toggleTextFieldVisibility();
        _focusNode.unfocus();
      }, icon: Icon(Icons.search,color: Color(0xff6F24E9) ,size: 35,)), 
       Visibility(child:  Positioned(child:
        Padding(padding: EdgeInsets.all(16),child:SizedBox(
          height: 45,
          width: 160,
          child: TextField(
            focusNode: _focusNode,
            autofocus: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              )
            ),
          )) ,), ) , visible: _isTextFieldVisible,)
        ],
      ),
      IconButton(onPressed: (){}, icon: Icon(Icons.notifications_on_rounded,color: Color(0xff6F24E9) ,size: 35,))
     ],),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
           Padding(
             padding: const EdgeInsets.only(top: 30),
             child: Image.asset('assets/images/vector4.png'),
           ),
          Row(children: [
             Padding(
               padding: const EdgeInsets.all(18),
               child: GestureDetector(onTap: () => _onContainerTap(0),
                 child: Container(
                           width: 85,
                           height: 18,
                          decoration: BoxDecoration(
                color: _selectedIndex == 0 ?Color(0xff6F24E9) : Color(0x806F24E9),
                borderRadius: BorderRadius.circular(5)
              ),
              child: Text('My Notes',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
               ),
               ),
             ),
            GestureDetector(onTap: () => _onContainerTap(1),
              child: Container(
              width: 85,
              height: 18,
              decoration: BoxDecoration(
                color: _selectedIndex == 1 ?Color(0xff6F24E9) : Color(0x806F24E9),
                borderRadius: BorderRadius.circular(5)
              ),
                 child: Text('Shared Notes',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                       ),
            ),
            Spacer(),
            IconButton(onPressed: (){}, icon: ImageIcon(Image.asset('assets/images/tag.png',color: Color(0xff6F24E9),).image)),
            Text('category',style: TextStyle(fontWeight: FontWeight.bold),),
              IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down_rounded,color: Color(0xff6F24E9),))
          ],),
            Image.asset('assets/images/vector4.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset('assets/images/checklist.png'),
              Text('No Notes yet?',style: TextStyle(fontSize: 24,),),
              Text('Click the + button to add Notes',style: TextStyle(fontSize: 14))
            ],)
          ],),
        ),
      ),
      );
  }
}

