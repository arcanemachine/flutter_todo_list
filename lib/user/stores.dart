import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_todo_list/state.dart';

class User {
  String username = "";
  String email = "";
  bool isAuthenticated = false;
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(User());

  Future<bool> isAuthenticated() async {
    final bool isAuthenticated =
        await secureStorage.read("authToken") == null ? false : true;
    return isAuthenticated;
  }

  Future<bool> confirmAuthenticationStatus() async {
    return false; // TO-DO
  }

  Future<bool> login() async {
    return false; // TO-DO
  }

  Future<void> logout() async {
    await secureStorage.read("authToken") == null ? false : true;
  }
}

// final userProvider = StateNotifierProvider
final userProvider = StateNotifierProvider<UserNotifier, Object>((ref) {
  return UserNotifier();
});
