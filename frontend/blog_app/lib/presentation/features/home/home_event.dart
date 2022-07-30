import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class HomeTabChanged extends HomeEvent{
  int tabIndex;
  HomeTabChanged(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];

}




