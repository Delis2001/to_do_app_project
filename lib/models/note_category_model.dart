import 'dart:convert';

class NoteCategoryModel {
  String? title;
  String? content;
  NoteCategoryModel({
    this.title,
    this.content,
  });

  NoteCategoryModel copyWith({
    String? title,
    String? content,
  }) {
    return NoteCategoryModel(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(title != null){
      result.addAll({'title': title});
    }
    if(content != null){
      result.addAll({'content': content});
    }
  
    return result;
  }

  factory NoteCategoryModel.fromMap(Map<String, dynamic> map) {
    return NoteCategoryModel(
      title: map['title'],
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteCategoryModel.fromJson(String source) => NoteCategoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'NoteCategoryModel(title: $title, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NoteCategoryModel &&
      other.title == title &&
      other.content == content;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode;
}
