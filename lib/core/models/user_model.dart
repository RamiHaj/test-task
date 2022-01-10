// To parse this JSON data, do
//
//     final User = UserFromJson(jsonString);

import 'dart:convert';

import 'package:objectbox/objectbox.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

@Entity()
class User {
  User({
    this.id = 0,
    this.userName,
    this.password,
    this.fullName,
    this.phoneNumber,
    this.city,
    this.isLog = false,
  });

  int id;
  final String? userName;
  final String? password;
  final String? fullName;
  final String? phoneNumber;
  final String? city;
  bool isLog;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userName: json["userName"],
        password: json["password"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "city": city,
      };
}
