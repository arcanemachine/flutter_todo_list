// import 'package:flutter/foundation.dart';

class _Constants {
  String get projectName => "Todo List";
  String get basePath => "http://192.168.1.100:8001";
  //     kDebugMode ? "http://192.168.1.100:8001" : "https://your-domain.com";
  String get apiRoot => "$basePath/api";
}

final globals = _Constants();
