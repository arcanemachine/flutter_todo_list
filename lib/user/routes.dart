import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/user/screens/login.dart';
import 'package:flutter_todo_list/user/screens/user_detail.dart';
import 'package:flutter_todo_list/user/screens/register.dart';
import 'package:flutter_todo_list/user/screens/settings.dart';

final List<GoRoute> userRoutes = [
  GoRoute(
    path: '/user',
    name: 'user:user_detail',
    builder: (context, state) => const UserDetailScreen(),
    redirect: (BuildContext context, GoRouterState state) =>
        helpers.routesLoginRequired(),
  ),
  GoRoute(
    path: '/user/login',
    name: 'user:login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/user/register',
    name: 'user:register',
    builder: (context, state) => const RegisterScreen(),
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      child: const RegisterScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeIn)),
        ),
        child: child,
      ),
    ),
  ),
  GoRoute(
    path: '/user/settings',
    name: 'user:settings',
    builder: (context, state) => const SettingsScreen(),
  ),
];
