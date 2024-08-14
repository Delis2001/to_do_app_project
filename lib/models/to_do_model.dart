import 'dart:convert';

class ToDoModel {
  String title;
  String content;
  ToDoModel({
    required this.title,
    required this.content,
  });

  ToDoModel copyWith({
    String? title,
    String? content,
  }) {
    return ToDoModel(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'title': title});
    result.addAll({'content': content});
  
    return result;
  }

  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      title: map['title'] ?? '',
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoModel.fromJson(String source) => ToDoModel.fromMap(json.decode(source));

  @override
  String toString() => 'ToDoModel(title: $title, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ToDoModel &&
      other.title == title &&
      other.content == content;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode;
}
