class NoteModel {
  final String title;
  final String content;
  final DateTime createdAt;

  NoteModel({
    required this.title,
    required this.content,
    required this.createdAt,
  });

  // Factory method to create a Note from a map
  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['Title'],
      content: map['QuickNote'],
      createdAt: DateTime.parse(map['CreatedAt']),
    );
  }

  // Method to convert a Note into a map
  Map<String, dynamic> toMap() {
    return {
      'Title': title,
      'QuickNote': content,
      'CreatedAt': createdAt.toString(),
    };
  }
}



// import 'dart:convert';

// class NoteCategoryModel {
//   String? title;
//   String? content;
//   NoteCategoryModel({
//     this.title,
//     this.content,
//   });

//   NoteCategoryModel copyWith({
//     String? title,
//     String? content,
//   }) {
//     return NoteCategoryModel(
//       title: title ?? this.title,
//       content: content ?? this.content,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};
  
//     if(title != null){
//       result.addAll({'title': title});
//     }
//     if(content != null){
//       result.addAll({'content': content});
//     }
  
//     return result;
//   }

//   factory NoteCategoryModel.fromMap(Map<String, dynamic> map) {
//     return NoteCategoryModel(
//       title: map['title'],
//       content: map['content'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory NoteCategoryModel.fromJson(String source) => NoteCategoryModel.fromMap(json.decode(source));

//   @override
//   String toString() => 'NoteCategoryModel(title: $title, content: $content)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
  
//     return other is NoteCategoryModel &&
//       other.title == title &&
//       other.content == content;
//   }

//   @override
//   int get hashCode => title.hashCode ^ content.hashCode;
// }
