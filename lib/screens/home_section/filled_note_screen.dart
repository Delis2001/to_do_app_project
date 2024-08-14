// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unnecessary_import, unused_field, sort_child_properties_last

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/to_do_provider.dart';
import 'package:to_do_app/screens/home_section/setting_screen.dart';
import 'package:to_do_app/widgets/after_app_bar_designed_widget.dart';
import 'package:to_do_app/widgets/todo_drawer.dart';
import 'package:to_do_app/widgets/todo_listtile.dart';

class FilledNoteScreen extends StatefulWidget {
  const FilledNoteScreen({super.key});

  @override
  State<FilledNoteScreen> createState() => _FilledNoteScreenState();
}

class _FilledNoteScreenState extends State<FilledNoteScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  // For The Shared Notes and MyNotes between the category
  int _selectedIndex = -1;
  void _onContainerTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      //  Navigator.push(context, MaterialPageRoute(builder:(_)=> ToDONoteScreen(index: index) ));
    } else if (index == 1) {
      // Navigator.push(context, MaterialPageRoute(builder:(_)=> ToDoShareScreen(index: index) ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        drawer: ToDoDrawerWidget(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () {
              _globalKey.currentState?.openDrawer();
            },
            child: CircleAvatar(
              radius: 25,
              backgroundImage:
                  Image.asset('assets/images/circle_avatar.png').image,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Color(0xff6F24E9),
                  size: 35,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_on_rounded,
                  color: Color(0xff6F24E9),
                  size: 35,
                ))
          ],
        ),
        body: Consumer<ToDoProvider>(builder: (context, ToDoProvider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                   AfterAppBarUiDesignedWidget(onTap: ()=> _onContainerTap(0) ,containerColor1: _selectedIndex == 0 ?Color(0xff6F24E9) : Color(0x806F24E9),secondOnTap: ()=>  _onContainerTap(1),containerColor2: _selectedIndex == 1 ?Color(0xff6F24E9) : Color(0x806F24E9),firstTitle: 'My ToDos',secondeTitle: 'Shared ToDos',),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ToDoProvider.toDo.isEmpty
                                ? Center(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                            'assets/images/checklist.png'),
                                        Text(
                                          'No Notes yet?',
                                          style: TextStyle(
                                            fontSize: 24,
                                          ),
                                        ),
                                        Text('Click the + button to add ToDos',
                                            style: TextStyle(fontSize: 14))
                                      ],
                                    ),
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                     
                                     ToDoListTile()
                                    ],
                                  )
                          ])
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
