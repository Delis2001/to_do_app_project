// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/note_category_model.dart';
import 'package:to_do_app/providers/note_category_provider.dart';

class CreateNotesScreen extends StatefulWidget {
  const CreateNotesScreen({super.key});

  @override
  State<CreateNotesScreen> createState() => _CreateNotesScreenState();
}

class _CreateNotesScreenState extends State<CreateNotesScreen> {
  final TextEditingController contentController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
      NoteModel newNote = NoteModel(
      title: titleController.text.trim(),
      content: contentController.text.trim(),
      createdAt: DateTime.now(),
    );
         Navigator.pop(context);
          noteProvider.addNote(newNote);
              // final title = titleController.text.trim();
              // final content = contentController.text.trim();
              // if (title.isNotEmpty && content.isNotEmpty) {
              //   final category =
              //       NoteCategoryModel(title: title, content: content);
              //   Provider.of<NoteCategoryProvider>(context, listen: false)
              //       .addCategory(category);
              //   Navigator.of(context).pop();
              // } else {
              //   Navigator.of(context).pop();
              //   //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter both title and content separated by ":"')));
              // }
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Notes'),
        actions: [
          Image.asset(
            'assets/images/vector3.png',
            color: Color(0xff6F24E9),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              height: 20,
              color: Color(0xff6F24E9),
              'assets/images/delete.png',
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextField(
                controller: titleController,
                cursorColor: Color(0xff6F24E9),
                enabled: true,
                autofocus: true,
                enableSuggestions: true,
                showCursor: true,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(fontSize: 25),
                    border: UnderlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TextField(
                controller: contentController,
                cursorColor: Color(0xff6F24E9),
                enabled: true,
                autofocus: true,
                enableSuggestions: true,
                showCursor: true,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: 'Quick Note...',
                    hintStyle: TextStyle(
                      color: Color(0xff6F24E9),
                    ),
                    border: UnderlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            Spacer(),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/tag.png',
                      color: Color(0xff6F24E9),
                    )),
                Text(
                  'category',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                          children: [
                            Column(
                              children: [
                                ListTile(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => SimpleDialog(
                                          children: [
                                            ListTile(
                                              leading: Image.asset(
                                                color: Color(0xff6F24E9),
                                                'assets/images/tag.png',
                                              ),
                                              title: Text('all categories',
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xff6F24E9))),
                                            ),
                                            ListTile(
                                              leading: Image.asset(
                                                'assets/images/tag.png',
                                              ),
                                              title: Text('Kodex'),
                                            ),
                                            ListTile(
                                              leading: Image.asset(
                                                'assets/images/tag.png',
                                              ),
                                              title: Text('Webstack'),
                                            ),
                                            ListTile(
                                              leading: Image.asset(
                                                'assets/images/tag.png',
                                              ),
                                              title: Text('Univyerse'),
                                            ),
                                            ListTile(
                                              leading: Image.asset(
                                                'assets/images/tag.png',
                                              ),
                                              title: Text('Lorem Iposum'),
                                            ),
                                            ListTile(
                                              leading: Image.asset(
                                                'assets/images/tag.png',
                                              ),
                                              title: Text('Nunc ac'),
                                            ),
                                            ListTile(
                                              leading: Icon(
                                                Icons.add,
                                                color: Color(0xff6F24E9),
                                              ),
                                              title: Text(
                                                'new category',
                                                style: TextStyle(
                                                    color: Color(0xff6F24E9)),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    leading: Image.asset(
                                      'assets/images/tag.png',
                                      color: Color(0xff6F24E9),
                                    ),
                                    title: Text(
                                      'all categories',
                                      style:
                                          TextStyle(color: Color(0xff6F24E9)),
                                    )),
                                ListTile(
                                  leading: Icon(
                                    Icons.add,
                                    color: Color(0xff6F24E9),
                                  ),
                                  title: Text(
                                    'new category',
                                    style: TextStyle(color: Color(0xff6F24E9)),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_up_outlined,
                      color: Color(0xff6F24E9),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
