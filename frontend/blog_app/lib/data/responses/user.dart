import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

class UserResponse {
  const UserResponse({
    required this.username,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.intro,
    required this.registeredAt,
    required this.lastLoginAt,
  });
  final String username;
  final String firstName;
  final String middleName;
  final String lastName;
  final String email;
  final String mobile;
  final String intro;
  final String registeredAt;
  final String lastLoginAt;

  UserResponse copyWith({
    String? username,
    String? firstName,
    String? middleName,
    String? lastName,
    String? email,
    String? mobile,
    String? intro,
    String? registeredAt,
    String? lastLoginAt,
  }) {
    return UserResponse(
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      intro: intro ?? this.intro,
      registeredAt: registeredAt ?? this.registeredAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'email': email,
      'mobile': mobile,
      'intro': intro,
      'registeredAt': registeredAt,
      'lastLoginAt': lastLoginAt,
    };
  }

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
      username: map['username'] ?? '',
      firstName: map['firstName'] ?? '',
      middleName: map['middleName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      mobile: map['mobile'] ?? '',
      intro: map['intro'] ?? '',
      registeredAt: map['registeredAt'] ?? '',
      lastLoginAt: map['lastLoginAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponse.fromJson(String source) =>
      UserResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserResponse(username: $username, firstName: $firstName, middleName: $middleName, lastName: $lastName, email: $email, mobile: $mobile, intro: $intro, registeredAt: $registeredAt, lastLoginAt: $lastLoginAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserResponse &&
      other.username == username &&
      other.firstName == firstName &&
      other.middleName == middleName &&
      other.lastName == lastName &&
      other.email == email &&
      other.mobile == mobile &&
      other.intro == intro &&
      other.registeredAt == registeredAt &&
      other.lastLoginAt == lastLoginAt;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      firstName.hashCode ^
      middleName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      mobile.hashCode ^
      intro.hashCode ^
      registeredAt.hashCode ^
      lastLoginAt.hashCode;
  }
}
