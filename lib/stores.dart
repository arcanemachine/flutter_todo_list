import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_list/state.dart';

// class RoutePreviousNotifier extends StateNotifier<String> {
//   RoutePreviousNotifier() : super("");
//
//   String get() {
//     return state;
//   }
//
//   void set(String value) {
//     state = value;
//   }
// }
//
// final routePreviousProvider =
//     StateNotifierProvider<RoutePreviousNotifier, String>((ref) {
//   return RoutePreviousNotifier();
// });

final isLoadingProvider = StateProvider<bool>((ref) => false);
final themeProvider = StateProvider<String>((ref) => sharedPrefs.darkMode);
