import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/models/note_category_model.dart';

class NoteProvider with ChangeNotifier {
  List<NoteModel> _notes = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<NoteModel> get notes => _notes;

  Future<void> addNote(NoteModel note) async {
    // Add note to the local list
    _notes.add(note);
    notifyListeners();

    // Add note to Firestore
      try {
      await _firestore.collection('Notes').add(note.toMap()).then((doc) {
       print('DocumentSnapshot added with ID: ${doc.id}');
      });
    } catch (e) {
      print('Failed to add note to Firestore: $e');
    }
  }

  void removeNote(NoteModel note) {
    _notes.remove(note);
    notifyListeners();
    // You can also implement the Firestore delete logic here
  }

  // Other methods like updateNote can be added here
}


// import 'package:flutter/material.dart';
// import 'package:to_do_app/models/note_category_model.dart';

// class NoteCategoryProvider extends ChangeNotifier{
//   List<NoteCategoryModel> _notes= [];
// List<NoteCategoryModel> get note => _notes;

// void addCategory(NoteCategoryModel note){
//   _notes.add(note);
//   notifyListeners();
// }
// void removeCategory(int index){
//   _notes.removeAt(index);
//   notifyListeners();
// }
// }