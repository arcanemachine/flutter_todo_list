import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// import 'package:flutter_todo_list/helpers.dart';
import 'package:flutter_todo_list/main.dart';
import 'package:flutter_todo_list/user/routes.dart';

final List<GoRoute> _routes = [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const InitScreen(),
      ),
    ] +
    userRoutes;

final GoRouter router = GoRouter(
  routes: _routes,
);
