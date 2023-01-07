import 'package:flutter/material.dart';
import 'package:flutter_todo_list/user/helpers.dart';
import 'package:flutter_todo_list/user/stores.dart';
import 'package:go_router/go_router.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      ),
      body: _refreshIndicator(context, ref),
    );
  }

  Widget _refreshIndicator(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: ref.read(userProvider.notifier).refresh,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      child: Column(
        children: [
          Expanded(
            child: _futureBuilder(context, ref),
          ),
        ],
      ),
    );
  }

  Widget _futureBuilder(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.read(userProvider.notifier).fetch(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _futureSuccess(context, ref);
        } else if (!snapshot.hasError) {
          return _futureLoading(context);
        } else {
          return _futureError(context);
        }
      },
    );
  }

  Widget _futureLoading(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        CircularProgressIndicator(),
        SizedBox(height: 16.0),
        Center(
          child: Text("Loading data..."),
        ),
      ],
    );
  }

  Widget _futureError(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Error: Could not retrieve data from the server.",
          ),
          const SizedBox.square(dimension: 16.0),
          ElevatedButton(
            onPressed: () {
              context.pushReplacementNamed("todos:todos");
            },
            child: const Text("Try again"),
          )
        ],
      ),
    );
  }

  Widget _futureSuccess(BuildContext context, WidgetRef ref) {
    return const UserDetail();
  }
}

class UserDetail extends ConsumerWidget {
  const UserDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget title() {
      return Column(
        children: <Widget>[
          const SizedBox(height: 16.0),
          Text(
            ref.watch(userProvider)!.username,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      );
    }

    Widget userDetail() {
      // for (int i = 0; i < ref.watch(userProvider).keys.length; i++) {}
      return Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Email",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              trailing: Text(
                ref.watch(userProvider)!.email as String,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }

    Widget textButtonLogout() {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: TextButton(
          child: const Text(
            "Log out of this account",
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          onPressed: () => userHelpers.showDialogLogout(context, ref),
        ),
      );
    }

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        title(),
        userDetail(),
        textButtonLogout(),
      ],
    );
  }
}
