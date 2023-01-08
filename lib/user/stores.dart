import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_todo_list/openapi/lib/api.dart';
import 'package:flutter_todo_list/state.dart';

class UserNotifier extends StateNotifier<UserDetails?> {
  UserNotifier() : super(UserDetails(username: ""));

  // get pk => state?.username;
  // get username => state?.username;
  // get email => state?.email;
  // get firstName => state?.firstName;
  // get lastName => state?.lastName;
  UserDetails? get user => state;

  Future refresh() {
    return fetch(forceRefresh: true).then((value) {
      state = value;
    });
  }

  Future fetch({bool forceRefresh = false}) async {
    // return cached value
    if (!forceRefresh && state!.username.isNotEmpty) {
      return state;
    }

    final authApi =
        authApiCreate(token: await secureStorage.read('auth_token'));

    Future result = authApi.authUserRetrieve().then((user) => state = user);

    return result;
  }

  Future<bool> confirmAuthenticationStatus() async {
    return false; // todo
  }

  Future<void> register(
    String username,
    String email,
    String password1,
    String password2,
  ) async {
    // create unauthenticated API client
    AuthApi authApi = authApiCreate();

    // build request
    var registerRequest = RegisterRequest(
        username: username,
        email: email,
        password1: password1,
        password2: password2);

    // get and save auth token (allows immediate login)
    Token? token = await authApi.authRegistrationCreate(registerRequest);

    // save token to secure storage
    await secureStorage.login(token!.key);

    // register with API server to receive FCM notifications
    try {
      await fcmNotificationsRegister();
    } catch (err) {
      debugPrint("Could not register FCM device with our API server.");
    }

    // save auth status to shared preferences
    sharedPrefs.login();
  }

  Future<void> login(String username, String password) async {
    // create unauthenticated API client
    AuthApi authApi = authApiCreate();

    // make login request
    AuthToken? authToken =
        await authApi.authLoginTokenCreate(username, password);

    // save token to secure storage
    await secureStorage.login(authToken!.token as String);

    // register with API server to receive FCM notifications
    try {
      await fcmNotificationsRegister();
    } catch (err) {
      debugPrint("Could not register FCM device with our API server.");
    }

    // save auth status to shared preferences
    sharedPrefs.login();
  }

  Future<void> fcmNotificationsRegister() async {
    final AuthApi authApi =
        authApiCreate(token: await secureStorage.read('auth_token'));

    try {
      final String? fcmToken = await FirebaseMessaging.instance.getToken();
      final gcmDeviceRequest =
          GCMDeviceRequest(registrationId: fcmToken as String);

      authApi.authFcmCreate(gcmDeviceRequest);
    } catch (err) {
      debugPrint("Could not register for FCM notifications.");
    }
  }

  Future<void> logout() async {
    await secureStorage.logout();
    sharedPrefs.logout();
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserDetails?>((ref) {
  return UserNotifier();
});

// final userIsAuthenticatedProvider = StateProvider<bool>((ref) {
//   return sharedPrefs.userIsAuthenticated;
// });
