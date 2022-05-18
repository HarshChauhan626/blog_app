import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';

@immutable
abstract class HomeState extends Equatable {

  int? activePageIndex=0;

  HomeState({this.activePageIndex});

  @override
  List<Object> get props => [activePageIndex??0];
}

@immutable
class HomeInitialState extends HomeState {
  @override
  String toString() => 'HomeInitialState';
}


class HomeLoadedState extends HomeState {

  HomeLoadedState({int? activePageIndex}):super(activePageIndex:activePageIndex);

  @override
  String toString() => 'HomeLoadedState';

  @override
  List<Object> get props => [activePageIndex??0];
}
