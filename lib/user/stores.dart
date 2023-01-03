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

  Future<ApiClient> apiClientGet() async {
    return apiClientCreate(
        token: await secureStorage.storage.read(key: "auth_token") ?? "");
  }

  // Future<String> csrfmiddlewaretokenGet({bool renew = false}) async {
  //   if (state.csrfmiddlewaretoken.isEmpty || renew == true) {
  //     // retrieve new token
  //     Csrfmiddlewaretoken? token =
  //         await utilsApi.utilsCsrfmiddlewaretokenRetrieve();
  //     if (token != null) {
  //       state.csrfmiddlewaretoken = token.csrfmiddlewaretoken;
  //     }
  //   }
  //   return Future<String>.value(state.csrfmiddlewaretoken);
  // }

  Future<bool> isAuthenticated() async {
    final bool isAuthenticated =
        await secureStorage.read("authToken") == null ? false : true;
    return isAuthenticated;
  }

  Future<bool> confirmAuthenticationStatus() async {
    return false; // TO-DO
  }

  Future<AuthToken?> login(String username, String password) async {
    AuthToken? token = await authApi.authLoginTokenCreate(
        username, password, state.email ?? "");

    return token;
  }

  Future<void> logout() async {
    // await secureStorage.read("authToken") == null ? false : true;
  }
}

// final userProvider = StateNotifierProvider
final userProvider = StateNotifierProvider<UserNotifier, Object>((ref) {
  return UserNotifier();
});
