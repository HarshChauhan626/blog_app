import 'dart:convert';

class User {
  final String username;
  final String firstName;
  final String middleName;
  final String lastName;
  final String email;
  final String mobile;
  final String intro;
  User({
    required this.username,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.intro,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'email': email,
      'mobile': mobile,
      'intro': intro,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] ?? '',
      firstName: map['firstName'] ?? '',
      middleName: map['middleName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      mobile: map['mobile'] ?? '',
      intro: map['intro'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

