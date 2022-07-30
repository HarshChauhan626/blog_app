import 'dart:convert';

class BlogListEntity{
  List<BlogEntity> blogEntityList;

  BlogListEntity({required this.blogEntityList});

}



class BlogEntity {
  int? id;
  String? title;
  String? metaTitle;
  int? published;
  List<String>? tag;
  AuthorDetailsEntity? authorDetails;
  String? createdAt;
  String? updatedAt;

  BlogEntity(
      {this.id,
        this.title,
        this.metaTitle,
        this.published,
        this.tag,
        this.authorDetails,
        this.createdAt,
        this.updatedAt});

  BlogEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    metaTitle = json['meta_title'];
    published = json['published'];
    tag = json['tag'].cast<String>();
    authorDetails = json['author_details'] != null
        ? AuthorDetailsEntity.fromJson(json['author_details'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['meta_title'] = metaTitle;
    data['published'] = published;
    data['tag'] = tag;
    if (authorDetails != null) {
      data['author_details'] = authorDetails!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
  

}

class AuthorDetailsEntity {
  int? id;
  String? name;

  AuthorDetailsEntity({this.id, this.name});

  AuthorDetailsEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}