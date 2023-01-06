import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_list/stores.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_todo_list/constants.dart';
import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/state.dart';
import 'package:flutter_todo_list/user/helpers.dart';

class _BaseWidgets {
  Widget emptyPlaceholder() {
    return const SizedBox.square(dimension: 0.0);
  }

  PreferredSizeWidget appBar(
    BuildContext context,
    WidgetRef ref, {
    String? title,
    List<Widget> extraActions = const <Widget>[],
    List<PopupMenuItem> extraPopupMenuItems = const <PopupMenuItem>[],
    bool hideBackButton = false,
    bool hideSettings = false,
  }) {
    /* back button */
    Widget? backButton(BuildContext context) {
      if (helpers.canPop(context)) {
        return IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: "Go Back",
          onPressed: () {
            context.pop();
          },
        );
      } else {
        return null;
      }
    }

    /* popup menu items */
    List<PopupMenuItem> popupMenuItems = [...extraPopupMenuItems];

    // append settings menu to popup items
    if (!hideSettings) {
      popupMenuItems.add(
        PopupMenuItem(
          child: const Text("Settings"),
          onTap: () {
            context.pushNamed('user:settings');
          },
        ),
      );
    }

    // print(sharedPrefs.userIsAuthenticated);

    if (sharedPrefs.userIsAuthenticated) {
      // ignore: todo
      // TODO: user profile icon

      void showDialogLogout() {
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

      // append
      popupMenuItems = [
        ...popupMenuItems,
        PopupMenuItem(
          child: const Text("Logout"),
          onTap: () {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                showDialogLogout();
              },
            );
          },
        ),
      ];
    } else {
      // unauthenticated user actions
    }

    /* app bar actions */
    // show custom actions first
    List<Widget> appBarActions = List<Widget>.from(extraActions);

    appBarActions = List<Widget>.from(appBarActions);
    if (popupMenuItems.isNotEmpty) {
      // show popup menu on the end of the list
      appBarActions.addAll(
        [
          PopupMenuButton(
            itemBuilder: (context) {
              return popupMenuItems;
            },
          ),
        ],
      );
    }

    return AppBar(
      leading: !hideBackButton ? backButton(context) : null,
      title: Row(
        children: <Widget>[
          Text(title ?? constants.projectName),
          ref.watch(isLoadingProvider.notifier).state
              ? Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: loadingSpinner(color: Colors.white),
                )
              : emptyPlaceholder(),
        ],
      ),
      actions: appBarActions,
    );
  }

  Widget loadingSpinner({double? size, Color? color}) {
    return SizedBox(
      height: size ?? 20.0,
      width: size ?? 20.0,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        color: color,
      ),
    );
  }
}

final baseWidgets = _BaseWidgets();
