import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_todo_list/openapi/lib/api.dart';
import 'package:flutter_todo_list/constants.dart';

// API clients
ApiClient apiClientCreate({String? token}) {
  /** If user is authenticated, add authorization data to HTTP headers. */
  if (token == null) {
    return ApiClient(basePath: constants.basePath);
  } else {
    ApiKeyAuth authentication = ApiKeyAuth("header", "Authorization");
    authentication.apiKeyPrefix = "Token";
    authentication.apiKey = token;

    return ApiClient(
      basePath: constants.basePath,
      authentication: authentication,
    );
  }
}

AuthApi authApiCreate({String? token}) =>
    AuthApi(apiClientCreate(token: token));
TodosApi todosApiCreate(String token) =>
    TodosApi(apiClientCreate(token: token));
// UtilsApi utilsApiCreate({String? token}) =>
//     UtilsApi(apiClientCreate(token: token));

// deleteme
final ApiClient apiClient = apiClientCreate();
final AuthApi authApi = authApiCreate();
// final TodosApi todosApi = todosApiCreate();
// final UtilsApi utilsApi = utilsApiCreate();

// shared preferences
class SharedPrefs {
  late SharedPreferences? _sharedPrefs;

  init() async {
    _sharedPrefs = await SharedPreferences.getInstance();

    // clear ephemeral data on startup
    // _sharedPrefs?.remove('route_previous');

    // set default values
    if (_sharedPrefs?.getBool('is_authenticated') != true) {
      _sharedPrefs?.setBool('is_authenticated', false);
    }
  }

  // utility
  void clearAll() {
    _sharedPrefs?.clear();
  }

  void readAll() {
    debugPrint("darkMode: '$darkMode'");
    debugPrint('userIsAuthenticated: "$userIsAuthenticated"');
  }

  void clearSession() {
    logout();
    // _sharedPrefs?.remove('company_name_current');
  }

  // auth
  bool get userIsAuthenticated =>
      _sharedPrefs?.getBool('is_authenticated') ?? false;
  set userIsAuthenticated(bool val) {
    _sharedPrefs?.setBool('is_authenticated', val);
  }

  login() {
    _sharedPrefs?.setBool('is_authenticated', true);
  }

  logout() {
    _sharedPrefs?.setBool('is_authenticated', false);
  }

  // darkMode
  String get darkMode => _sharedPrefs?.getString('dark_mode') ?? 'auto';
  set darkMode(String val) {
    _sharedPrefs?.setString('dark_mode', val);
  }

  // // routes
  // String get routeCurrent => _sharedPrefs?.getString('route_current') ?? "";
  // set routeCurrent(String val) {
  //   _sharedPrefs?.setString('route_current', val);
  // }
}

final SharedPrefs sharedPrefs = SharedPrefs();

// secure storage
class SecureStorage {
  // init() async {}
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  // crud
  Future read(String key) async {
    var readData = await storage.read(key: key);
    return readData;
  }

  Future readAll() async {
    return await storage.readAll();
  }

  Future write(String key, String value) async {
    var writeData = await storage.write(key: key, value: value);
    return writeData;
  }

  Future delete(String key) async {
    var deleteData = await storage.delete(key: key);
    return deleteData;
  }

  Future clear() async {
    await storage.deleteAll();
  }

  // auth
  Future<bool> userIsAuthenticated() async {
    return await storage.read(key: "auth_token") != null ? true : false;
  }

  Future<void> login(String token) async {
    await storage.write(key: "auth_token", value: token);
  }

  Future<void> logout() async {
    await storage.delete(key: "auth_token");
  }
}

final secureStorage = SecureStorage();
