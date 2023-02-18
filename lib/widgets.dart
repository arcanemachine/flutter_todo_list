import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_list/providers.dart';
import 'package:flutter_todo_list/styles.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_todo_list/globals.dart';
// import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/state.dart';
import 'package:flutter_todo_list/user/helpers.dart';

class _BaseWidgets {
  PreferredSizeWidget appBar(
    BuildContext context,
    WidgetRef ref, {
    String? title,
    List<Widget> extraActions = const <Widget>[],
    List<PopupMenuItem> extraPopupMenuItems = const <PopupMenuItem>[],
    bool hideBackButton = false,
    bool hideSettings = false,
    bool hideUserProfile = false,
  }) {
    // /* back button */
    // Widget? backButton() {
    //   if (helpers.canPop(context)) {
    //     return IconButton(
    //       icon: const Icon(Icons.arrow_back),
    //       tooltip: "Go Back",
    //       onPressed: () {
    //         context.pop();
    //       },
    //     );
    //   } else {
    //     return null;
    //   }
    // }

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

    if (sharedPrefs.userIsAuthenticated) {
      // append
      popupMenuItems = [
        ...popupMenuItems,
        PopupMenuItem(
          child: const Text("Logout"),
          onTap: () {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => userHelpers.showDialogLogout(context, ref),
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

    if (sharedPrefs.userIsAuthenticated && !hideUserProfile) {
      // user profile icon
      appBarActions.add(
        IconButton(
          onPressed: () {
            context.pushNamed("user:user_detail");
          },
          icon: const Icon(Icons.person),
          tooltip: "Your profile",
        ),
      );
    } else {
      // unauthenticated user actions
    }

    if (popupMenuItems.isNotEmpty) {
      // show extra actions at the end
      appBarActions.addAll(
        [
          PopupMenuButton(
            itemBuilder: (context) {
              return popupMenuItems;
            },
            tooltip: "Menu",
          ),
        ],
      );
    }

    return AppBar(
      // leading: !hideBackButton ? backButton() : null,
      title: Row(
        children: <Widget>[
          Text(title ?? globals.projectName),
          ref.watch(isLoadingProvider)
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

  Widget disablableButton({
    isDisabled = true,
    dynamic onPressed,
    dynamic disabledOnPressed,
    Widget? child,
    Widget? disabledChild,
  }) {
    onPressed ??= () {};
    child ??= const Text("Disabled");

    if (!isDisabled) {
      return ElevatedButton(onPressed: onPressed, child: child);
    } else {
      return disabledButton(onPressed: disabledOnPressed, child: disabledChild);
    }
  }

  Widget disabledButton({dynamic onPressed, Widget? child}) {
    onPressed ??= () {};
    child ??= const Text("Disabled");

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colors.palette.secondary)),
      child: child,
    );
  }

  Widget emptyPlaceholder() {
    return const SizedBox.square(dimension: 0.0);
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
