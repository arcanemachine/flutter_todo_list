import 'package:flutter/foundation.dart';

class _Constants {
  String get projectName => "Todo List";
}

final constants = _Constants();

const basePath =
    kDebugMode ? "http://192.168.1.100:8001" : "https://your-domain.com";
const apiRoot = "$basePath/api";
