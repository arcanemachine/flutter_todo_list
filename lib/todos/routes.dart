import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/todos/screens/todos.dart';

final List<GoRoute> todosRoutes = [
  GoRoute(
    path: '/todos',
    name: 'todos:todos',
    builder: (BuildContext context, GoRouterState state) => const TodosScreen(),
    redirect: (BuildContext context, GoRouterState state) =>
        helpers.routesLoginRequired(),
  ),
];
