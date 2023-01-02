import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shiftopoly/globals.dart';
import 'package:shiftopoly/helpers.dart';
import 'package:shiftopoly/state.dart';

class UsersWidgets {
  PreferredSizeWidget loggedInAppBar(
    BuildContext context,
    {
      // String? routePrevious,
      List<Widget>? extraActions,
      bool showBackButton = true,
      bool showSettings = true,
      String? title,
    }
  ) {

    void _logout(BuildContext context) {
      secureStorage.delete('user_api_token').then((x) {
        sharedPrefs.clearSession();
        sharedPrefs.logout();

        if (!kDebugMode) {
          Restart.restartApp(webOrigin: '/');
        } else {
          while (helpers.canPop(context)) {
            Navigator.pop(context);
          }
          context.go('/');
          widgetHelpers.snackBarShow(context, "Logout successful");
        }

      });
    }

    void _showDialogSwitchCompanies(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Switch Companies?"),
          content: const Text(
            "Are you sure you want to view your Employee profile for a "
            "different Company?"
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("No"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                sharedPrefs.clearSession();
                if (!kDebugMode) {
                  Restart.restartApp(webOrigin: '/companies');
                } else {
                  context.goNamed('companies:companyList');
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      );
    }

    void _showDialogLogout(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text(
            "Are you sure you want to log out?"
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("No"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("Yes"),
              onPressed: () {
                _logout(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }

    List<PopupMenuItem> _popupMenuItems = [];

    if (showSettings) {
      // add settings menu
      _popupMenuItems.add(
        PopupMenuItem(
          child: const Text("Settings"),
          onTap: () {
            context.pushNamed('users:settings');
          },
        )
      );
    }

    // append other menu items
    _popupMenuItems.addAll([
      PopupMenuItem(
        child: const Text("Switch Companies"),
        onTap: () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _showDialogSwitchCompanies(context);
          });
        },
      ),
      PopupMenuItem(
        child: const Text("Logout"),
        onTap: () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _showDialogLogout(context);
          });
        },
      ),
    ]);

    // create AppBar actions
    List<Widget> _appBarActions = [];

    // if custom actions passed in, add them to the list
    if (extraActions != null) {
      _appBarActions = List<Widget>.from(_appBarActions)..addAll(extraActions);
    }

    // show primary popup menu on the end of the list
    _appBarActions = List<Widget>.from(_appBarActions)..addAll([
      PopupMenuButton(
        itemBuilder: (context) {
          return _popupMenuItems;
        },
      ),
    ]);

    Widget? _backButton(BuildContext context) {
      if (helpers.canPop(context)) {
        return IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: "Go Back",
          onPressed: () { context.pop(); },
        );
      } else {
        return null;
      }

      // use previous route, pop the context, or show no back button
      // if (routePrevious != null) {
      //   return IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //       tooltip: "Back",
      //     onPressed: () { context.go(routePrevious); },
      //   );
      // } else if (sharedPrefs.routePrevious != "") {
      //   return IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () { context.go(sharedPrefs.routePrevious); },
      //   );
      // } else {
      //   if (helpers.canPop(context)) {
      //     return IconButton(
      //       icon: const Icon(Icons.arrow_back),
      //       tooltip: "Go Back",
      //       onPressed: () { context.pop(); },
      //     );
      //   } else {
      //     return null;
      //   }
      // }
    }

    final String appBarTitle = title ??
      (sharedPrefs.companyNameCurrent != "" ? sharedPrefs.companyNameCurrent
      : constants.projectName);

    return AppBar(
      leading: showBackButton ? _backButton(context) : null,
      title: Text(appBarTitle),
      actions: _appBarActions,
    );
  }

}
