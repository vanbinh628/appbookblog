import 'dart:convert';

class Book {
  final int id;
  final String title;
  final String description;
  final int pageCount;
  final String excerpt;
  final String publishDate;
  bool isCheck;
  Book({
    required this.id,
    required this.title,
    required this.description,
    required this.pageCount,
    required this.excerpt,
    required this.publishDate,
    this.isCheck = false,
  });

  Book copyWith({
    int? id,
    String? title,
    String? description,
    int? pageCount,
    String? excerpt,
    String? publishDate,
    bool? isCheck,
  }) {
    return Book(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        pageCount: pageCount ?? this.pageCount,
        excerpt: excerpt ?? this.excerpt,
        publishDate: publishDate ?? this.publishDate,
        isCheck: isCheck ?? this.isCheck);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'pageCount': pageCount,
      'excerpt': excerpt,
      'publishDate': publishDate,
      'isCheck': isCheck
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'].toInt() as int,
      title: map['title'] as String,
      description: map['description'] as String,
      pageCount: map['pageCount'].toInt() as int,
      excerpt: map['excerpt'] as String,
      publishDate: map['publishDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Book(id: $id, title: $title, description: $description, pageCount: $pageCount, excerpt: $excerpt, publishDate: $publishDate)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.pageCount == pageCount &&
        other.excerpt == excerpt &&
        other.publishDate == publishDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        pageCount.hashCode ^
        excerpt.hashCode ^
        publishDate.hashCode;
  }
}
