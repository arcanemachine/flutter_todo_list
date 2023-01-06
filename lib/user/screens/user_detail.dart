import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_todo_list/globals.dart';
import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/styles.dart';
import 'package:flutter_todo_list/user/stores.dart';
import 'package:flutter_todo_list/widgets.dart';

class UserDetailScreen extends ConsumerWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: baseWidgets.appBar(
        context,
        ref,
        title: "Your Profile",
        hideUserProfile: true,
        extraPopupMenuItems: [
          PopupMenuItem(
            child: const Text("Register account"),
            onTap: () => context.pushNamed("user:register"),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          _formTitle(context),
          _buttonRegister(context),
        ],
      ),
    );
  }

  Widget _formTitle(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16.0),
        Text(
          "Welcome to ${globals.projectName}!",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "Please login to continue.",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        )
      ],
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: TextButton(
        child: const Text(
          "Register new account",
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
        onPressed: () {
          context.pushNamed("user:register");
        },
      ),
    );
  }
}
