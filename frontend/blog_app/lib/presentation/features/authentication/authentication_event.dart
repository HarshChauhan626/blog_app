import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class AppStarted extends AuthenticationEvent {}


class LoggedIn extends AuthenticationEvent {
  final String token;

  LoggedIn(this.token);

  @override
  List<Object> get props => [token];
}

@immutable
class LoggedOut extends AuthenticationEvent {}
