import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_todo_list/globals.dart';
import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/styles.dart';
import 'package:flutter_todo_list/user/stores.dart';
import 'package:flutter_todo_list/widgets.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: baseWidgets.appBar(
        context,
        ref,
        title: "Login",
        // hideBackButton: true,
        extraPopupMenuItems: [
          PopupMenuItem(
            child: const Text("Register account"),
            onTap: () => context.pushNamed("user:register"),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _formTitle(context),
            const LoginForm(),
            _textButtonRegister(context),
          ],
        ),
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

  Widget _textButtonRegister(BuildContext context) {
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

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends ConsumerState<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  bool get _loginButtonEnabled =>
      !_isLoading &&
      _usernameController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty;

  // controllers
  // final _usernameController = TextEditingController();
  // final _passwordController = TextEditingController();
  final _usernameController = TextEditingController.fromValue(
    const TextEditingValue(text: "user"),
  );
  final _passwordController = TextEditingController.fromValue(
    const TextEditingValue(text: "distance"),
  );

  // methods
  void _handleSubmit() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    setState(() => _isLoading = true); // show loading spinner

    // login
    ref.read(userProvider.notifier).login(username, password).then((value) {
      context.pushReplacementNamed("todos:todos"); // success url

      // success message
      widgetHelpers.snackBarShow(context, "Login successful");
    }).catchError((err) {
      setState(() => _isLoading = false); // hide loading spinner
      widgetHelpers.snackBarShowApiException(context, err); // error message
    });
  }

  // widgets
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  _fieldUsername(),
                  _fieldPassword(),
                  const SizedBox(height: 32.0),
                  _buttonSubmit(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fieldUsername() {
    return TextFormField(
      controller: _usernameController,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        labelText: "Username",
      ),
      onChanged: (dynamic x) => setState(() {}),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "This field must not be empty.";
        }
        return null;
      },
    );
  }

  Widget _fieldPassword() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.key),
        labelText: "Password",
      ),
      onChanged: (_) => setState(() {}),
      onFieldSubmitted: (_) => _handleSubmit(),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "This field must not be empty.";
        }
        return null;
      },
    );
  }

  Widget _buttonSubmit() {
    return Center(
      child: ElevatedButton(
        style: _loginButtonEnabled
            ? styles.button.elevatedLgPrimary
            : styles.button.elevatedLgSecondary,
        onPressed: () {
          _loginButtonEnabled
              ? _handleSubmit()
              : widgetHelpers.snackBarShow(context, "The form is incomplete.");
        },
        child: !_isLoading ? const Text("Login") : baseWidgets.loadingSpinner(),
      ),
    );
  }
}
