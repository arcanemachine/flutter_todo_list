import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restart_app/restart_app.dart';
import 'package:flutter_todo_list/constants.dart';
import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/state.dart';

class UserWidgets {
  PreferredSizeWidget appBar(
    BuildContext context, {
    String? title,
    List<Widget> extraActions = const [],
    bool showBackButton = true,
    bool showSettings = true,
  }) {
    List<PopupMenuItem> popupMenuItems = [];

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

    /* app bar actions */
    // show custom actions first
    List<Widget> appBarActions = List<Widget>.from(extraActions);

    /* popup menu items */
    if (sharedPrefs.isAuthenticated) {
      // user profile icon

      void logout(BuildContext context) {
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

      void showDialogLogout(BuildContext context) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("Confirm Logout"),
            content: const Text("Are you sure you want to log out?"),
            actions: <Widget>[
              TextButton(
                child: const Text("No"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text("Yes"),
                onPressed: () {
                  logout(context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      }

      appBarActions = List<Widget>.from(appBarActions)
        ..addAll([
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                // menu item - logout
                PopupMenuItem(
                  child: const Text("Logout"),
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showDialogLogout(context);
                    });
                  },
                ),
                ...popupMenuItems,
              ];
            },
          ),
        ]);
    } else {
      // unauthenticated user actions
    }

    popupMenuItems.addAll([
      // PopupMenuItem(
      //   child: const Text("Hello World!"),
      //   onTap: () {
      //     WidgetsBinding.instance.addPostFrameCallback((_) {
      //       // showDialogLogout(context);
      //     });
      //   },
      // ),
    ]);

    // append settings menu to popup items
    if (showSettings) {
      popupMenuItems.add(PopupMenuItem(
        child: const Text("Settings"),
        onTap: () {
          context.pushNamed('user:settings');
        },
      ));
    }

    // show primary popup menu on the end of the list
    appBarActions = List<Widget>.from(appBarActions)
      ..addAll([
        PopupMenuButton(
          itemBuilder: (context) {
            return popupMenuItems;
          },
        ),
      ]);

    final String appBarTitle = title ?? constants.projectName;

    return AppBar(
      leading: showBackButton ? backButton(context) : null,
      title: Text(appBarTitle),
      actions: appBarActions,
    );
  }

  // PreferredSizeWidget loggedOutAppBar(
  //   BuildContext context, {
  //   // String? routePrevious,
  //   List<Widget> extraAppBarActions = const [],
  //   bool showBackButton = true,
  //   bool showSettings = true,
  //   String? title,
  // }) {
  //   List<PopupMenuItem> popupMenuItems = [];

  //   if (showSettings) {
  //     // add settings menu
  //     popupMenuItems.add(PopupMenuItem(
  //       child: const Text("Settings"),
  //       onTap: () {
  //         context.pushNamed('user:settings');
  //       },
  //     ));
  //   }

  //   // append other menu items
  //   popupMenuItems.addAll([
  //     // PopupMenuItem(
  //     //   child: const Text("Hello World!"),
  //     //   onTap: () {
  //     //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //     //       // showDialogLogout(context);
  //     //     });
  //     //   },
  //     // ),
  //     // PopupMenuItem(
  //     //   child: const Text("Logout"),
  //     //   onTap: () {
  //     //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //     //       showDialogLogout(context);
  //     //     });
  //     //   },
  //     // ),
  //   ]);

  //   /* AppBar actions */
  //   List<Widget> appBarActions = [];

  //   // add
  //   appBarActions = List<Widget>.from(appBarActions)
  //     ..addAll(extraAppBarActions);

  //   // append generic options to the end of the list
  //   appBarActions = List<Widget>.from(appBarActions)
  //     ..addAll([
  //       PopupMenuButton(
  //         itemBuilder: (context) {
  //           return popupMenuItems;
  //         },
  //       ),
  //     ]);

  //   Widget? backButton(BuildContext context) {
  //     if (helpers.canPop(context)) {
  //       return IconButton(
  //         icon: const Icon(Icons.arrow_back),
  //         tooltip: "Go Back",
  //         onPressed: () {
  //           context.pop();
  //         },
  //       );
  //     } else {
  //       return null;
  //     }

  //     // use previous route, pop the context, or show no back button
  //     // if (routePrevious != null) {
  //     //   return IconButton(
  //     //     icon: const Icon(Icons.arrow_back),
  //     //       tooltip: "Back",
  //     //     onPressed: () { context.go(routePrevious); },
  //     //   );
  //     // } else if (sharedPrefs.routePrevious != "") {
  //     //   return IconButton(
  //     //     icon: const Icon(Icons.arrow_back),
  //     //     onPressed: () { context.go(sharedPrefs.routePrevious); },
  //     //   );
  //     // } else {
  //     //   if (helpers.canPop(context)) {
  //     //     return IconButton(
  //     //       icon: const Icon(Icons.arrow_back),
  //     //       tooltip: "Go Back",
  //     //       onPressed: () { context.pop(); },
  //     //     );
  //     //   } else {
  //     //     return null;
  //     //   }
  //     // }
  //   }

  //   final String appBarTitle = title ?? constants.projectName;

  //   return AppBar(
  //     leading: showBackButton ? backButton(context) : null,
  //     title: Text(appBarTitle),
  //     actions: appBarActions,
  //   );
  // }

  // PreferredSizeWidget loggedInAppBar(
  //   BuildContext context, {
  //   // String? routePrevious,
  //   List<Widget>? extraActions,
  //   bool showBackButton = true,
  //   bool showSettings = true,
  //   String? title,
  // }) {
  //   void logout(BuildContext context) {
  //     secureStorage.delete('user_api_token').then((x) {
  //       sharedPrefs.clearSession();
  //       sharedPrefs.logout();

  //       if (!kDebugMode) {
  //         Restart.restartApp(webOrigin: '/');
  //       } else {
  //         while (helpers.canPop(context)) {
  //           Navigator.pop(context);
  //         }
  //         context.go('/');
  //         widgetHelpers.snackBarShow(context, "Logout successful");
  //       }
  //     });
  //   }

  //   void showDialogLogout(BuildContext context) {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) => AlertDialog(
  //         title: const Text("Confirm Logout"),
  //         content: const Text("Are you sure you want to log out?"),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text("No"),
  //             onPressed: () => Navigator.pop(context),
  //           ),
  //           TextButton(
  //             child: const Text("Yes"),
  //             onPressed: () {
  //               logout(context);
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ],
  //       ),
  //     );
  //   }

  //   List<PopupMenuItem> popupMenuItems = [];

  //   if (showSettings) {
  //     // add settings menu
  //     popupMenuItems.add(PopupMenuItem(
  //       child: const Text("Settings"),
  //       onTap: () {
  //         context.pushNamed('user:settings');
  //       },
  //     ));
  //   }

  //   // append other menu items
  //   popupMenuItems.addAll([
  //     PopupMenuItem(
  //       child: const Text("Logout"),
  //       onTap: () {
  //         WidgetsBinding.instance.addPostFrameCallback((_) {
  //           showDialogLogout(context);
  //         });
  //       },
  //     ),
  //   ]);

  //   // create AppBar actions
  //   List<Widget> appBarActions = [];

  //   // if custom actions passed in, add them to the list
  //   if (extraActions != null) {
  //     appBarActions = List<Widget>.from(appBarActions)..addAll(extraActions);
  //   }

  //   // show primary popup menu on the end of the list
  //   appBarActions = List<Widget>.from(appBarActions)
  //     ..addAll([
  //       PopupMenuButton(
  //         itemBuilder: (context) {
  //           return popupMenuItems;
  //         },
  //       ),
  //     ]);

  //   Widget? backButton(BuildContext context) {
  //     if (helpers.canPop(context)) {
  //       return IconButton(
  //         icon: const Icon(Icons.arrow_back),
  //         tooltip: "Go Back",
  //         onPressed: () {
  //           context.pop();
  //         },
  //       );
  //     } else {
  //       return null;
  //     }
  //   }

  //   final String appBarTitle = title ?? constants.projectName;

  //   return AppBar(
  //     leading: showBackButton ? backButton(context) : null,
  //     title: Text(appBarTitle),
  //     actions: appBarActions,
  //   );
  // }

  // methods
}

final userWidgets = UserWidgets();
