import 'package:go_router/go_router.dart';

// import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/todos/screens.dart';

final List<GoRoute> todosRoutes = [
  GoRoute(
    path: '/todos',
    name: 'todos:todos',
    // builder: (context, state) => helpers.route(state, const SettingsScreen()),
    builder: (context, state) => const TodosScreen(),
    // pageBuilder: (context, state) => CustomTransitionPage<void>(
    //   key: state.pageKey,
    //   child: const LoginScreen(),
    //   transitionsBuilder: (context, animation, secondaryAnimation, child) =>
    //       SlideTransition(
    //     position: animation.drive(
    //       Tween<Offset>(
    //         begin: const Offset(-1.0, 0.0),
    //         end: Offset.zero,
    //       ).chain(CurveTween(curve: Curves.easeIn)),
    //     ),
    //     child: child,
    //   ),
    // ),
  ),
];
