import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_todo_list/constants.dart';
import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/state.dart';
import 'package:flutter_todo_list/styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: const <Widget>[
            LoginFormWidget(),
          ],
        ),
      ),
    );
  }
}

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
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

  void login(BuildContext context, String userApiToken) {
    secureStorage.write('user_api_token', userApiToken).then((x) {
      sharedPrefs.isLoggedIn = true;
      context.goNamed('companies:companyList');
      widgetHelpers.snackBarShow(context, "Login successful");
    });
  }

  // controllers
  // final _usernameController = TextEditingController();
  // final _passwordController = TextEditingController();
  final _usernameController =
      TextEditingController.fromValue(const TextEditingValue(text: 'user'));
  final _passwordController =
      TextEditingController.fromValue(const TextEditingValue(text: 'password'));

  // widgets
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
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
          ),
          _loginForm(),
          _registerButton(),
        ],
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: "Username *",
              ),
              onChanged: (x) => setState(() {}),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "This field must not be empty.";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.key),
                labelText: "Password *",
              ),
              onChanged: (x) => setState(() {}),
              onFieldSubmitted: (x) => _handleSubmit(),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "This field must not be empty.";
                }
                return null;
              },
            ),
            const SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                style: styles.button.elevatedLgPrimary,
                onPressed: _loginButtonEnabled
                    ? () {
                        _handleSubmit();
                      }
                    : null,
                child: !_isLoading
                    ? const Text("Login")
                    : const CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerButton() {
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

  // methods
  void _handleSubmit() async {
    // final String username = _usernameController.text;
    // final String password = _passwordController.text;

    // set loading status
    _isLoadingSet(true);

    // attempt to login

    // reset loading status
    _isLoadingSet(false);

    // login the user

    // display error message
  }
}