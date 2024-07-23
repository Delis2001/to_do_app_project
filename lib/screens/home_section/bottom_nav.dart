// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home_section/empty_note_home_screen.dart';
import 'package:to_do_app/screens/home_section/filled_note_screen.dart';
import 'package:to_do_app/screens/posts_and_edith_to_do/create_notes_screen.dart';
import 'package:to_do_app/screens/posts_and_edith_to_do/create_to_do_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedScreen= -1;
  void onTapScreen(int index){
    setState(() {
      selectedScreen = index;
    });
  }

  int index = 0;
  List screens = [
    EmptyNoteHomeScreen(),
    FilledNoteScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: ShapeBorder.lerp(CircleBorder(), CircleBorder(), BorderSide.strokeAlignInside),
        child: Icon(Icons.add,color: Colors.white,size: 30,),
        backgroundColor: Color(0xff6F24E9) ,
        onPressed: (){
           if(index == 0){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>CreateNotesScreen()));
           }else if (index == 1){
             Navigator.push(context, MaterialPageRoute(builder: (_)=>CreateToDoScreen()));
           }
           
        }),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Color(0xff6F24E9),size: 50),
        unselectedIconTheme: IconThemeData(color: Color(0x806F24E9),size: 30),
        unselectedLabelStyle: TextStyle(fontSize: 16),
        selectedLabelStyle: TextStyle(color:Color(0xff6F24E9),fontWeight: FontWeight.bold,fontSize: 16 ),
        onTap: (value){
          onTapScreen(index);
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
      
        items: [
        BottomNavigationBarItem(icon: ImageIcon(Image.asset('assets/images/note1.png').image),label: 'Notes'),
        BottomNavigationBarItem(icon: ImageIcon(Image.asset('assets/images/note.png').image),label: 'ToDo')
      ]),
      body: screens[index],
    );
  }
}