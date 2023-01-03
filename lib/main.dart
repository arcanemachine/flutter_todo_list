import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_todo_list/constants.dart';
import 'package:flutter_todo_list/routes.dart';
import 'package:flutter_todo_list/state.dart';
import 'package:flutter_todo_list/styles.dart';
import 'package:flutter_todo_list/todos/screens.dart';
import 'package:flutter_todo_list/user/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // load persistent data
  await sharedPrefs.init();
  await secureStorage.init();

  // // get CSRF token if user is unauthenticated
  // late String? csrfmiddlewaretoken;
  // if (sharedPrefs.userIsAuthenticated == false) {
  //   csrfmiddlewaretoken = await userHelpers.csrfmiddlewaretokenFetch();
  // }

  runApp(
    const ProviderScope(
      // child: MyApp(csrfmiddlewaretoken: csrfmiddlewaretoken),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultTheme = ThemeData(
      primarySwatch:
          styles.colors.generateMaterialColor(colors.palette.primary),
      appBarTheme: const AppBarTheme(
        toolbarHeight: 48.0,
      ),
    );

    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: constants.projectName,
      theme: defaultTheme,
      darkTheme: ThemeData.dark(),
      themeMode: sharedPrefs.darkMode == 'light'
          ? ThemeMode.light
          : sharedPrefs.darkMode == 'dark'
              ? ThemeMode.dark
              : ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}

class InitScreen extends ConsumerWidget {
  final String? csrfmiddlewaretoken;
  const InitScreen({Key? key, this.csrfmiddlewaretoken}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (sharedPrefs.userIsAuthenticated) {
      return const TodosScreen();
    } else {
      return const LoginScreen();
    }
  }
}
