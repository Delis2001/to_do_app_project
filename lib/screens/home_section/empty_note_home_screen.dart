// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unnecessary_import, sort_child_properties_last, non_constant_identifier_names, avoid_types_as_parameter_names



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/datas/category_data.dart';
import 'package:to_do_app/providers/note_category_provider.dart';

import 'package:to_do_app/screens/home_section/setting_screen.dart';
import 'package:to_do_app/screens/posts_and_edith_to_do/create_notes_screen.dart';
import 'package:to_do_app/widgets/after_app_bar_designed_widget.dart';
import 'package:to_do_app/widgets/note_listtile_widget.dart';
import 'package:to_do_app/widgets/note_drawer_widget.dart';


class EmptyNoteHomeScreen extends StatefulWidget {
  const EmptyNoteHomeScreen({super.key});

  @override
  State<EmptyNoteHomeScreen> createState() => _EmptyNoteHomeScreenState();
}

class _EmptyNoteHomeScreenState extends State<EmptyNoteHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  // For The Shared Notes and MyNotes between the category
  int _selectedIndex = -1;
  void _onContainerTap(int index){
    setState(() {
      _selectedIndex = index;
    });
    if(index == 0){
     //  Navigator.push(context, MaterialPageRoute(builder:(_)=> MyNoteScreen(index: index) ));
    }else if(index == 1){
 // Navigator.push(context, MaterialPageRoute(builder:(_)=> SharedNotesScreen(index: index) ));
    }
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer:NoteDrawerWidegt(),
     appBar: AppBar(
      automaticallyImplyLeading: false,
      title: GestureDetector(onTap: () {
      _scaffoldKey.currentState?.openDrawer();
      },
        child: CircleAvatar(
          radius: 25,
          backgroundImage: Image.asset('assets/images/circle_avatar.png').image,),
      ),
      actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Color(0xff6F24E9) ,size: 30,)), 
      IconButton(onPressed: (){}, icon: Icon(Icons.notifications_on_rounded,color: Color(0xff6F24E9) ,size: 35,))
     ],),
      body:Consumer<NoteCategoryProvider>(builder: (context, NoteCategoryProvider, child) {
        return  Column(children: [
       SingleChildScrollView(
        child: Center(
          child: Column(children: [
            AfterAppBarUiDesignedWidget(onTap: ()=> _onContainerTap(0) ,containerColor1: _selectedIndex == 0 ?Color(0xff6F24E9) : Color(0x806F24E9),secondOnTap: ()=>  _onContainerTap(1),containerColor2: _selectedIndex == 1 ?Color(0xff6F24E9) : Color(0x806F24E9),firstTitle: 'My Notes',secondeTitle: 'Shared Notes',),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             NoteCategoryProvider.note.isEmpty ?Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Image.asset('assets/images/checklist.png'),
               Text('No Notes yet?',style: TextStyle(fontSize: 24,),),
               Text('Click the + button to add Notes',style: TextStyle(fontSize: 14))
                ],),) : SizedBox(
                  height: 200,
                  child: NoteListTileWidget()
                )
            ],),
          ],)
        ),
      ),
   ],);
 },));
  }
}

