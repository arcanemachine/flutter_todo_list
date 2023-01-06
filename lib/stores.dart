import 'package:flutter_riverpod/flutter_riverpod.dart';

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

// StateProviders allow you to directly manipulate the state of an object
final isLoadingProvider = StateProvider<bool>((ref) => false);
