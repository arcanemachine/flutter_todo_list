import 'package:go_router/go_router.dart';

import 'package:shiftopoly/helpers.dart';
import 'package:shiftopoly/users/screens/login.dart';
import 'package:shiftopoly/users/screens/settings.dart';

final List<GoRoute> usersRoutes = [
  GoRoute(
    path: '/users/login',
    name: 'users:login',
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
    path: '/users/settings',
    name: 'users:settings',
    builder: (context, state) => helpers.route(state, const SettingsScreen()),
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
