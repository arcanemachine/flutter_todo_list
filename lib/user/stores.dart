// import 'dart:html';

// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_todo_list/openapi/lib/api.dart';
import 'package:flutter_todo_list/state.dart';

class User {
  User({
    // this.isAuthenticated = false,
    this.username,
    this.email,
    this.apiClient,
  });

  // bool isAuthenticated = false;
  String? username;
  String? email;
  ApiClient? apiClient;
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(User());

  Future<ApiClient> apiClientGet() async {
    String token = await secureStorage.storage.read(key: "auth_token") ?? "";
    if (token.isEmpty) {
      // create unauthenticated API client
      return apiClientCreate();
    } else {
      return apiClientCreate(token: token);
    }
  }

  // bool get isAuthenticated => state.isAuthenticated;

  Future<bool> confirmAuthenticationStatus() async {
    return false; // todo
  }

  Future<void> login(String username, String password) async {
    // create unauthenticated API client
    AuthApi authApi = authApiCreate();

    // get auth token
    AuthToken? authToken =
        await authApi.authLoginTokenCreate(username, password);

    // // update user authentication status
    // state.isAuthenticated = true;

    // save token to secure storage
    await secureStorage.login(authToken!.token as String);

    // save auth status to shared preferences (for easy non-async access)
    sharedPrefs.login();
  }

  Future<void> logout() async {
    await secureStorage.logout();
    sharedPrefs.logout();
  }
}

final userProvider = StateNotifierProvider<UserNotifier, Object>((ref) {
  return UserNotifier();
});

// final userIsAuthenticatedProvider = StateProvider<bool>((ref) {
//   return sharedPrefs.userIsAuthenticated;
// });
