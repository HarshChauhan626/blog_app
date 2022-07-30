import 'package:blog_app/data/responses/blog_response.dart';
import 'package:blog_app/domain/entities/blog.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';

@immutable
abstract class HomeState extends Equatable {

  int? activePageIndex=0;
  BlogListEntity? blogListEntity;

  HomeState({this.activePageIndex,this.blogListEntity});

  @override
  List<Object> get props => [activePageIndex??0,blogListEntity??[]];
}

@immutable
class HomeInitialState extends HomeState {
  HomeInitialState({int? activePageIndex,BlogListEntity? blogListEntity}):super(activePageIndex:activePageIndex,blogListEntity:blogListEntity);
  @override
  List<Object> get props => [activePageIndex??0,blogListEntity??[]];
}

@immutable
class HomeLoadingState extends HomeState{

  int? activePageIndex;

  HomeLoadingState({required this.activePageIndex}):super(activePageIndex: activePageIndex);

}

@immutable
class HomeLoadedState extends HomeState {

  HomeLoadedState({int? activePageIndex,BlogListEntity? blogListEntity}):super(activePageIndex:activePageIndex,blogListEntity: blogListEntity);

  @override
  String toString() => 'HomeLoadedState';

  @override
  List<Object> get props => [activePageIndex??0,blogListEntity??[]];
}

@immutable
class HomeErrorState extends HomeState {
  int? activePageIndex=0;
  String? errorText;
  HomeErrorState({required String? errorText,required this.activePageIndex}):super(activePageIndex: activePageIndex);

  @override
  List<Object> get props => [activePageIndex??0,errorText??""];

}


