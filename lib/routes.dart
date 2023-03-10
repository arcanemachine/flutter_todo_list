import 'package:go_router/go_router.dart';

import 'package:flutter_todo_list/main.dart';
import 'package:flutter_todo_list/todos/routes.dart';
import 'package:flutter_todo_list/user/routes.dart';

final List<GoRoute> _routes = [
      GoRoute(
        path: '/',
        builder: (context, state) => const InitScreen(),
      ),
    ] +
    todosRoutes +
    userRoutes;

final GoRouter router = GoRouter(
  routes: _routes,
  // debugLogDiagnostics: true,
);
