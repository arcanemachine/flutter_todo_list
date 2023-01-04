import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/user/stores.dart';

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
}

final userHelpers = _UserHelpers();
