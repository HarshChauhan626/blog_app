import 'dart:convert';

class BlogResponse {
  final int id;
  final String title;
  final String metaTitle;
  final String summary;
  final String published;
  final String content;
  final String source;
  final String updatedAt;
  final String createdAt;
  final String collectionId;
  final String authorId;
  BlogResponse({
    required this.id,
    required this.title,
    required this.metaTitle,
    required this.summary,
    required this.published,
    required this.content,
    required this.source,
    required this.updatedAt,
    required this.createdAt,
    required this.collectionId,
    required this.authorId,
  });

  BlogResponse copyWith({
    int? id,
    String? title,
    String? metaTitle,
    String? summary,
    String? published,
    String? content,
    String? source,
    String? updatedAt,
    String? createdAt,
    String? collectionId,
    String? authorId,
  }) {
    return BlogResponse(
      id: id ?? this.id,
      title: title ?? this.title,
      metaTitle: metaTitle ?? this.metaTitle,
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
      'metaTitle': metaTitle,
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

  factory BlogResponse.fromMap(Map<String, dynamic> map) {
    return BlogResponse(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      metaTitle: map['metaTitle'] ?? '',
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

  factory BlogResponse.fromJson(String source) => BlogResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BlogResponse(id: $id, title: $title, metaTitle: $metaTitle, summary: $summary, published: $published, content: $content, source: $source, updatedAt: $updatedAt, createdAt: $createdAt, collectionId: $collectionId, authorId: $authorId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BlogResponse &&
        other.id == id &&
        other.title == title &&
        other.metaTitle == metaTitle &&
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
        metaTitle.hashCode ^
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
