import 'package:flutter/material.dart';

class SharedNotesScreen extends StatefulWidget {
  final int index;
  const SharedNotesScreen({super.key, required this.index});

  @override
  State<SharedNotesScreen> createState() => _SharedNoteScreenState();
}

class _SharedNoteScreenState extends State<SharedNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}