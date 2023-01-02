import 'package:flutter/material.dart';

import 'package:flutter_todo_list/state.dart';
import 'package:go_router/go_router.dart';

class _Helpers {
  _ExampleHelpers get example => _ExampleHelpers();

  bool canPop(BuildContext context) {
    final NavigatorState? navigator = Navigator.maybeOf(context);
    return navigator != null && navigator.canPop();
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

  Widget saveRoute(GoRouterState state, Widget widget) {
    /** Save incoming route to shared preferences so that it will be seen first
      * when first opening the app.
      */

    sharedPrefs.routeCurrent = state.location;

    return widget;
  }
}

final helpers = _Helpers();

// example
class _ExampleHelpers {
  Future<List> listFetch() async {
    /** Returns enough data to populate the user's companyList. */

    return ["hello", "world"];
  }
}

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
}

final widgetHelpers = _WidgetHelpers();
