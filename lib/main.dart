import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_todo_list/constants.dart';
// import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/routes.dart';
import 'package:flutter_todo_list/state.dart';
import 'package:flutter_todo_list/styles.dart';
import 'package:flutter_todo_list/todos/screens/todos.dart';
import 'package:flutter_todo_list/user/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await sharedPrefs.init(); // load persistent data

  if (await secureStorage.userIsAuthenticated()) {
    // // todo: confirm auth status or logout
    // helpers.confirmAuthStatusOrLogout();
  }

  runApp(
    const ProviderScope(
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
      routerConfig: router,
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
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!sharedPrefs.userIsAuthenticated) {
      return const LoginScreen();
    } else {
      return const TodosScreen();
    }
  }
}
