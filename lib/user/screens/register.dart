import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_todo_list/globals.dart';
import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/styles.dart';
import 'package:flutter_todo_list/user/providers.dart';
import 'package:flutter_todo_list/widgets.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: baseWidgets.appBar(
        context,
        ref,
        title: "Register Account",
        hideBackButton: true,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            _formTitle(context),
            const RegisterForm(),
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
          globals.projectName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "Register a new account",
            style: Theme.of(context).textTheme.titleMedium,
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
          "Login to an existing account",
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
        onPressed: () {
          while (context.canPop()) {
            context.pop();
          }
          context.pushReplacementNamed("user:login");
        },
      ),
    );
  }
}

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends ConsumerState<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  bool get _loginButtonEnabled =>
      !_isLoading &&
      _usernameController.text.isNotEmpty &&
      _emailController.text.isNotEmpty &&
      _password1Controller.text.isNotEmpty &&
      _password2Controller.text.isNotEmpty;

  // controllers
  // final _usernameController = TextEditingController.fromValue(
  //   const TextEditingValue(text: "user"),
  // );
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();

  // methods
  void _handleSubmit() {
    final String username = _usernameController.text;
    final String email = _emailController.text;
    final String password1 = _password1Controller.text;
    final String password2 = _password2Controller.text;

    setState(() {
      _isLoading = true;
    });

    // login
    ref
        .read(userProvider.notifier)
        .register(username, email, password1, password2)
        .then((value) {
      context.pushReplacementNamed("todos:todos"); // success url

      // success message
      widgetHelpers.snackBarShow(
          context, "Registration successful. You are now logged in.");
    }).catchError((err) {
      setState(() => _isLoading = false); // done loading
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
                  _fieldEmail(),
                  _fieldPassword1(),
                  _fieldPassword2(),
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
        icon: Icon(Icons.email),
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

  Widget _fieldEmail() {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        labelText: "Email",
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

  Widget _fieldPassword1() {
    return TextFormField(
      controller: _password1Controller,
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

  Widget _fieldPassword2() {
    return TextFormField(
      controller: _password2Controller,
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.key),
        labelText: "Confirm password",
      ),
      onChanged: (_) => setState(() {}),
      onFieldSubmitted: (_) => _handleSubmit(),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "This field must not be empty.";
        } else if (val != _password1Controller.text) {
          return "The passwords do not match.";
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
        child:
            !_isLoading ? const Text("Register") : baseWidgets.loadingSpinner(),
      ),
    );
  }
}
