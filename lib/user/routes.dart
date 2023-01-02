import 'package:go_router/go_router.dart';

import 'package:flutter_todo_list/user/screens/login.dart';
import 'package:flutter_todo_list/user/screens/settings.dart';

final List<GoRoute> userRoutes = [
  GoRoute(
    path: '/user/login',
    name: 'user:login',
    builder: (context, state) => const LoginScreen(),
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
  GoRoute(
    path: '/user/settings',
    name: 'user:settings',
    builder: (context, state) => const SettingsScreen(),
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
