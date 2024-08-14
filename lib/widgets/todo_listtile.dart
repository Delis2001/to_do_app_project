// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/to_do_provider.dart';

class ToDoListTile extends StatefulWidget {
  const ToDoListTile({super.key});

  @override
  State<ToDoListTile> createState() => _ToDoListTileState();
}

class _ToDoListTileState extends State<ToDoListTile> {
   bool isCheckBox = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoProvider>(builder: (context, ToDoProvider, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
         Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Pending',
                                          style: TextStyle(
                                              color: Color(0xff6F24E9),
                                              fontSize: 24),
                                        ),
                                      ),
 SizedBox(  
                                        height: 200,
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: ToDoProvider.toDo.length,
                                          itemBuilder: (context, index) {
                                            final category =
                                                ToDoProvider.toDo[index];
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0,
                                                  bottom: 10,
                                                  right: 20,
                                                  left: 20),
                                              child: ListTile(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                leading: Checkbox(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xff6F24E9),
                                                        width: 2),
                                                    value: isCheckBox,
                                                    onChanged: (bool? newBool) {
                                                      setState(() {
                                                        isCheckBox = newBool!;
                                                      });
                                                    }),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                tileColor: Color(0xffD9D9D9),
                                                trailing: GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                          context: context,
                                                          builder:
                                                              (context) =>
                                                                  SimpleDialog(
                                                                    shape: ShapeBorder.lerp(
                                                                        LinearBorder(),
                                                                        LinearBorder(),
                                                                        BorderSide
                                                                            .strokeAlignInside),
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          IconButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              icon: Icon(
                                                                                Icons.cancel,
                                                                                color: Color(0xff6F24E9),
                                                                                size: 30,
                                                                              )),
                                                                          Text(
                                                                              '1 Note Selected'),
                                                                          Spacer(),
                                                                          IconButton(
                                                                            onPressed:
                                                                                () {},
                                                                            icon:
                                                                                Image.asset(
                                                                              color: Color(0xff6F24E9),
                                                                              'assets/images/pin.png',
                                                                            ),
                                                                          ),
                                                                          IconButton(
                                                                            onPressed:
                                                                                () {
                                                                              ToDoProvider.removeToDo(index);
                                                                            },
                                                                            icon:
                                                                                Image.asset(
                                                                              color: Color(0xff6F24E9),
                                                                              'assets/images/delete.png',
                                                                            ),
                                                                          ),
                                                                          IconButton(
                                                                            onPressed:
                                                                                () {},
                                                                            icon:
                                                                                Image.asset(
                                                                              color: Color(0xff6F24E9),
                                                                              'assets/images/tag.png',
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ));
                                                    },
                                                    child: ImageIcon(Image.asset(
                                                            'assets/images/dots.png')
                                                        .image)),
                                                title: Text(
                                                  category.title,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle:
                                                    Text(category.content),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Completed',
                                          style: TextStyle(
                                              color: Color(0xff6F24E9),
                                              fontSize: 24),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 200,
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: ToDoProvider.toDo.length,
                                          itemBuilder: (context, index) {
                                            final category =
                                                ToDoProvider.toDo[index];
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0,
                                                  bottom: 10,
                                                  right: 20,
                                                  left: 20),
                                              child: ListTile(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                leading: Checkbox(
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xff6F24E9),
                                                        width: 2),
                                                    value: isCheckBox,
                                                    onChanged: (bool? newBool) {
                                                      setState(() {
                                                        isCheckBox = newBool!;
                                                      });
                                                    }),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                tileColor: Color(0xffD9D9D9),
                                                trailing: GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                          context: context,
                                                          builder:
                                                              (context) =>
                                                                  SimpleDialog(
                                                                    shape: ShapeBorder.lerp(
                                                                        LinearBorder(),
                                                                        LinearBorder(),
                                                                        BorderSide
                                                                            .strokeAlignInside),
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          IconButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              icon: Icon(
                                                                                Icons.cancel,
                                                                                color: Color(0xff6F24E9),
                                                                                size: 30,
                                                                              )),
                                                                          Text(
                                                                              '1 Note Selected'),
                                                                          Spacer(),
                                                                          IconButton(
                                                                            onPressed:
                                                                                () {},
                                                                            icon:
                                                                                Image.asset(
                                                                              color: Color(0xff6F24E9),
                                                                              'assets/images/pin.png',
                                                                            ),
                                                                          ),
                                                                          IconButton(
                                                                            onPressed:
                                                                                () {
                                                                              ToDoProvider.removeToDo(index);
                                                                            },
                                                                            icon:
                                                                                Image.asset(
                                                                              color: Color(0xff6F24E9),
                                                                              'assets/images/delete.png',
                                                                            ),
                                                                          ),
                                                                          IconButton(
                                                                            onPressed:
                                                                                () {},
                                                                            icon:
                                                                                Image.asset(
                                                                              color: Color(0xff6F24E9),
                                                                              'assets/images/tag.png',
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ));
                                                    },
                                                    child: ImageIcon(Image.asset(
                                                            'assets/images/dots.png')
                                                        .image)),
                                                title: Text(
                                                  category.title,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle:
                                                    Text(category.content),
                                              ),
                                            );
                                          },
                                        ),
                                      )
      ],);
    },);
  }
}