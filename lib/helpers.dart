import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_todo_list/openapi/lib/api.dart';
import 'package:flutter_todo_list/state.dart';

class _Helpers {
  // _ExampleHelpers get example => _ExampleHelpers();

  bool canPop(BuildContext context) {
    final NavigatorState? navigator = Navigator.maybeOf(context);
    return navigator != null && navigator.canPop();
  }

  // Future confirmAuthStatusOrLogout() async {}

  String? routeLoginRequired() {
    if (!sharedPrefs.userIsAuthenticated) {
      return "/"; // redirect to login
    } else {
      return null; // continue to route
    }
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  // Widget saveRoute(GoRouterState state, Widget widget) {
  //   /** Save incoming route to shared preferences so that it will be seen
  //     * first when first opening the app.
  //     */
  //   sharedPrefs.routeCurrent = state.location;
  //   return widget;
  // }
}

final helpers = _Helpers();

// // example
// class _ExampleHelpers {
//   Future<List> listFetch() async {
//     /** Returns enough data to populate the user's companyList. */
//
//     return ["hello", "world"];
//   }
// }

// widgets
class _WidgetHelpers {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarShow(
      BuildContext context, String message,
      [SnackBarAction? customAction]) {
    /** Hide existing snackbars and show a new one. */
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // hide existing snackbars
    scaffoldMessenger.clearSnackBars();

    return scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(message),
        action: customAction ??
            SnackBarAction(
              label: 'OK',
              onPressed: () {},
            ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      snackBarShowApiException(BuildContext context, ApiException error,
          [SnackBarAction? customAction]) {
    /** Parse ApiException and show a snackbar message. */

    /* parse error message(s) and return the first error in the message body */
    String errorField = "";
    late String message;

    if (error.message != null) {
      Map<String, dynamic> messageJson = jsonDecode(error.message as String);

      if (messageJson.containsKey('detail')) {
        message = messageJson['detail'];
      } else if (messageJson.containsKey('non_field_errors')) {
        message = messageJson['non_field_errors'][0];
      } else {
        String firstKey = messageJson.keys.first;
        message = messageJson[firstKey][0];
        errorField = " ($firstKey)";
      }
    } else {
      message = "An unknown error occurred.";
    }

    final int statusCode = error.code;
    if (statusCode != 400) {
      return snackBarShow(context, "Error $statusCode: $message");
    } else {
      return snackBarShow(context, "Error$errorField: $message");
    }
  }
}

final widgetHelpers = _WidgetHelpers();
