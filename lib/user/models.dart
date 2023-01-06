// import 'package:flutter/foundation.dart';

class User {
  User({
    required this.id,
    required this.username,
  });

  int id;
  String username;

  // representations
  @override
  String toString() {
    return 'User{id: $id, username: $username}';
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        username: json['username'],
      );

  // Future<void> deleteme() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   debugPrint("hello");
  // }
}
