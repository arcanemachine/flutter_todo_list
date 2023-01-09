import 'package:flutter_todo_list/helpers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_todo_list/globals.dart';
import 'package:flutter_todo_list/routes.dart';
import 'package:flutter_todo_list/state.dart';
import 'package:flutter_todo_list/stores.dart';
import 'package:flutter_todo_list/styles.dart';
import 'package:flutter_todo_list/todos/screens/todos.dart';
import 'package:flutter_todo_list/user/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await sharedPrefs.init(); // load persistent data

  if (await secureStorage.userIsAuthenticated()) {
    // // todo: confirm auth status (or logout)
    // helpers.confirmAuthStatusOrLogout();
  }

  try {
    await helpers.initializeFcm();
  } catch (err) {
    debugPrint("Could not initialize FCM.");
    // sharedPrefs.hasPlayServices = false;
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultTheme = ThemeData(
      primarySwatch:
          styles.colors.generateMaterialColor(colors.palette.primary),
      appBarTheme: const AppBarTheme(
        toolbarHeight: 48.0,
      ),
    );

    return MaterialApp.router(
      routerConfig: router,
      title: globals.projectName,
      theme: defaultTheme,
      darkTheme: ThemeData.dark(),
      themeMode: ref.watch(themeProvider) == 'light'
          ? ThemeMode.light
          : ref.watch(themeProvider) == 'dark'
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
