import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class Uninitialized extends AuthenticationState {}

@immutable
class Authenticated extends AuthenticationState {}

@immutable
class Unauthenticated extends AuthenticationState {}
