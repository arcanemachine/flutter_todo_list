// import 'dart:html';

// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_todo_list/openapi/lib/api.dart';
import 'package:flutter_todo_list/state.dart';

class User {
  User({
    this.isAuthenticated = false,
    this.username,
    this.email,
    this.csrftoken,
    this.csrfmiddlewaretoken = "",
    this.apiClient,
  });

  bool isAuthenticated;
  String? username;
  String? email;
  String? csrftoken;
  String csrfmiddlewaretoken;
  ApiClient? apiClient;
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(User());

  // Future<ApiClient> apiClientGet() async {
  //   String token = await secureStorage.storage.read(key: "auth_token") ?? "";
  //   if (token.isEmpty) {
  //     // create unauthenticated API client
  //     return apiClientCreate();
  //   } else {
  //     return apiClientCreate(token: token);
  //   }
  // }

  bool get isAuthenticated => state.isAuthenticated;

  Future<bool> confirmAuthenticationStatus() async {
    return false; // TO-DO
  }

  Future<void> login(String username, String password) async {
    AuthApi authApi = authApiCreate(); // create unauthenticated API client

    AuthToken? authToken =
        await authApi.authLoginTokenCreate(username, password);
    await secureStorage.login(authToken!.token as String);
    sharedPrefs.login();
  }

  Future<void> logout() async {
    // await secureStorage.read("authToken") == null ? false : true;
  }
}

// final userProvider = StateNotifierProvider
final userProvider = StateNotifierProvider<UserNotifier, Object>((ref) {
  return UserNotifier();
});
