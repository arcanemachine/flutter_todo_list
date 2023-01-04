import 'package:flutter/material.dart';
import 'package:flutter_todo_list/openapi/lib/api.dart';
import 'package:go_router/go_router.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_todo_list/constants.dart';
import 'package:flutter_todo_list/helpers.dart';
// import 'package:flutter_todo_list/state.dart';
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
        hideBackButton: true,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _formTitle(context),
            LoginForm(ref: ref),
            _buttonRegister(),
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
          "Welcome to ${constants.projectName}!",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Please login to continue.',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        )
      ],
    );
  }

  Widget _buttonRegister() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: TextButton(
        child: const Text(
          "Register new account",
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
        onPressed: () async {
          // navigate to registration route
        },
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final WidgetRef ref;
  const LoginForm({Key? key, required this.ref}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _isLoadingSet(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  bool get _loginButtonEnabled =>
      !_isLoading &&
      _usernameController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty;

  // controllers
  // final _usernameController = TextEditingController();
  // final _passwordController = TextEditingController();
  final _usernameController = TextEditingController.fromValue(
    const TextEditingValue(text: 'user'),
  );
  final _passwordController = TextEditingController.fromValue(
    const TextEditingValue(text: 'passwords'),
  );

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
      onChanged: (dynamic x) => setState(() {}),
      onFieldSubmitted: (dynamic x) => _handleSubmit(),
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
        child: !_isLoading
            ? const Text("Login")
            : const CircularProgressIndicator(),
      ),
    );
  }

  // methods
  // Future<void> login(BuildContext context, String authToken) async {
  //   await secureStorage.write('authToken', authToken).then((dynamic x) {
  //     sharedPrefs.userIsAuthenticated = true;
  //     context.goNamed('companies:companyList');
  //     widgetHelpers.snackBarShow(context, "Login successful");
  //   });
  // }

  void _handleSubmit() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    _isLoadingSet(true); // set loading status

    widget.ref // login
        .read(userProvider.notifier)
        .login(username, password)
        .then((value) {
      context.pushReplacement("/todos"); // success url

      // success message
      widgetHelpers.snackBarShow(context, "Login successful");
    }).catchError((err) {
      widgetHelpers.snackBarShowApiException(context, err); // error message
    });

    _isLoadingSet(false); // reset loading status
  }
}
