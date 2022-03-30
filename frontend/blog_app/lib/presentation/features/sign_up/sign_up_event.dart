import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpPressed extends SignUpEvent {
  final String email;
  final String password;
  final String firstName;
  final String? middleName;
  final String? lastName;

  SignUpPressed({required this.email, required this.password,required this.firstName,this.middleName,this.lastName});

  @override
  List<Object> get props => [email, password];
}

class SignUpPressedFacebook extends SignUpEvent {}

class SignUpPressedGoogle extends SignUpEvent {}

