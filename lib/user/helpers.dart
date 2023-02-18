import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/user/providers.dart';

class _UserHelpers {
  void logout(BuildContext context, WidgetRef ref) {
    ref.read(userProvider.notifier).logout().then((_) {
      // clear navigation stack
      while (helpers.canPop(context)) {
        Navigator.pop(context);
      }

      context.pushReplacement('/user/login'); // navigate to login screen

      // success message
      widgetHelpers.snackBarShow(context, "Logout successful");
    });
  }

  void showDialogLogout(BuildContext context, WidgetRef ref) {
    /// Confirm user intentions and logout (or cancel).
    {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Do you really want to log out?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () => userHelpers.logout(context, ref),
            ),
          ],
        ),
      );
    }
  }
}

final userHelpers = _UserHelpers();
