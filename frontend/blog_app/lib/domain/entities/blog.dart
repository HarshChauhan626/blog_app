import 'dart:convert';

class Blog {
  final int id;
  final String title;
  final String summary;
  final String published;
  final String content;
  final String source;
  final String updatedAt;
  final String createdAt;
  final String collectionId;
  final String authorId;
  Blog({
    required this.id,
    required this.title,
    required this.summary,
    required this.published,
    required this.content,
    required this.source,
    required this.updatedAt,
    required this.createdAt,
    required this.collectionId,
    required this.authorId,
  });

  Blog copyWith({
    int? id,
    String? title,
    String? summary,
    String? published,
    String? content,
    String? source,
    String? updatedAt,
    String? createdAt,
    String? collectionId,
    String? authorId,
  }) {
    return Blog(
      id: id ?? this.id,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      published: published ?? this.published,
      content: content ?? this.content,
      source: source ?? this.source,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      collectionId: collectionId ?? this.collectionId,
      authorId: authorId ?? this.authorId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'published': published,
      'content': content,
      'source': source,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
      'collectionId': collectionId,
      'authorId': authorId,
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      summary: map['summary'] ?? '',
      published: map['published'] ?? '',
      content: map['content'] ?? '',
      source: map['source'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      createdAt: map['createdAt'] ?? '',
      collectionId: map['collectionId'] ?? '',
      authorId: map['authorId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Blog.fromJson(String source) => Blog.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Blog(id: $id, title: $title, summary: $summary, published: $published, content: $content, source: $source, updatedAt: $updatedAt, createdAt: $createdAt, collectionId: $collectionId, authorId: $authorId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Blog &&
      other.id == id &&
      other.title == title &&
      other.summary == summary &&
      other.published == published &&
      other.content == content &&
      other.source == source &&
      other.updatedAt == updatedAt &&
      other.createdAt == createdAt &&
      other.collectionId == collectionId &&
      other.authorId == authorId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      summary.hashCode ^
      published.hashCode ^
      content.hashCode ^
      source.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode ^
      collectionId.hashCode ^
      authorId.hashCode;
  }
}
