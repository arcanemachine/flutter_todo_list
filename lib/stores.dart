import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoutePreviousNotifier extends StateNotifier<String> {
  RoutePreviousNotifier() : super("");

  String get() {
    return state;
  }

  void set(String value) {
    state = value;
  }
}

final routePreviousProvider =
    StateNotifierProvider<RoutePreviousNotifier, String>((ref) {
  return RoutePreviousNotifier();
});
