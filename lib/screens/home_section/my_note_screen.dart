import 'package:flutter/material.dart';

class MyNoteScreen extends StatefulWidget {
  final int index;
  const MyNoteScreen({super.key,required this.index});

  @override
  State<MyNoteScreen> createState() => _MyNoteScreenState();
}

class _MyNoteScreenState extends State<MyNoteScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(''),
    );
  }
}