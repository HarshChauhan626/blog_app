
import 'package:blog_app/domain/entities/blog.dart';

class BlogListResponse {
  List<BlogResponse>? blogResponseList;

  BlogListResponse({this.blogResponseList});

  BlogListResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      blogResponseList = <BlogResponse>[];
      json['results'].forEach((v) {
        blogResponseList?.add(BlogResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (blogResponseList != null) {
      data['results'] = blogResponseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  BlogListEntity toDomain(){
    if(blogResponseList!=null && blogResponseList!.isNotEmpty){
      print("Blog response list is not coming empty");
      return BlogListEntity(blogEntityList:blogResponseList!.map((e) => e.toDomain()).toList());
    }
    else{
      return BlogListEntity(blogEntityList:[]);
    }
  }

}

class BlogResponse {
  int? id;
  String? title;
  String? metaTitle;
  int? published;
  List<String>? tag;
  AuthorDetails? authorDetails;
  String? createdAt;
  String? updatedAt;

  BlogResponse(
      {this.id,
        this.title,
        this.metaTitle,
        this.published,
        this.tag,
        this.authorDetails,
        this.createdAt,
        this.updatedAt});

  BlogResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    metaTitle = json['meta_title'];
    published = json['published'];
    tag = json['tag'].cast<String>();
    authorDetails = json['author_details'] != null
        ? AuthorDetails.fromJson(json['author_details'])
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

  BlogEntity toDomain(){
    return BlogEntity.fromJson(toJson());
  }




}

class AuthorDetails {
  int? id;
  String? name;

  AuthorDetails({this.id, this.name});

  AuthorDetails.fromJson(Map<String, dynamic> json) {
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
