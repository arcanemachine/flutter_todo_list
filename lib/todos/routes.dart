import 'package:go_router/go_router.dart';

// import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/todos/screens/todos.dart';

final List<GoRoute> todosRoutes = [
  GoRoute(
    path: '/todos',
    name: 'todos:todos',
    builder: (context, state) => const TodosScreen(),
  ),
];
