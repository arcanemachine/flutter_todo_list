// import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_todo_list/openapi/lib/api.dart';
import 'package:flutter_todo_list/constants.dart';

// API client
final ApiClient apiClient = ApiClient(basePath: constants.basePath);
final TodosApi todosApiClient = TodosApi(apiClient);

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
    // if (kDebugMode) {
    //   print('isAuthenticated: "$isAuthenticated"');
    // }
  }

  void clearSession() {
    // _sharedPrefs?.remove('company_name_current');
    // _sharedPrefs?.remove('company_pk_current');
    // _sharedPrefs?.remove('employee_pk_current');
  }

  // // current company
  // String get companyNameCurrent =>
  //     _sharedPrefs?.getString('company_name_current') ?? "";
  // set companyNameCurrent(String val) {
  //   _sharedPrefs?.setString('company_name_current', val);
  // }

  // int get companyPkCurrent => _sharedPrefs?.getInt('company_pk_current') ?? 0;
  // set companyPkCurrent(int val) {
  //   _sharedPrefs?.setInt('company_pk_current', val);
  // }

  // int get employeePkCurrent => _sharedPrefs?.getInt('employee_pk_current') ?? 0;
  // set employeePkCurrent(int val) {
  //   _sharedPrefs?.setInt('employee_pk_current', val);
  // }

  // routes
  String get routeCurrent => _sharedPrefs?.getString('route_current') ?? "";
  set routeCurrent(String val) {
    _sharedPrefs?.setString('route_current', val);
  }

  // String get routePrevious =>
  //   _sharedPrefs?.getString('route_previous') ?? "";
  // set routePrevious(String val) {
  //   _sharedPrefs?.setString('route_previous', val);
  // }

  // darkMode
  String get darkMode => _sharedPrefs?.getString('dark_mode') ?? 'auto';
  set darkMode(String val) {
    _sharedPrefs?.setString('dark_mode', val);
  }

  // auth
  bool get isAuthenticated =>
      _sharedPrefs?.getBool('is_authenticated') ?? false;
  set isAuthenticated(bool val) {
    _sharedPrefs?.setBool('is_authenticated', val);
  }

  void login() {
    _sharedPrefs?.setBool('is_authenticated', true);
  }

  void logout() {
    _sharedPrefs?.setBool('is_authenticated', false);
  }
}

final SharedPrefs sharedPrefs = SharedPrefs();

// secure storage
class SecureStorage {
  init() async {}
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // crud
  Future read(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  Future readAll() async {
    return await _storage.readAll();
  }

  Future write(String key, String value) async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  Future delete(String key) async {
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }

  Future clear() async {
    await _storage.deleteAll();
  }

  // auth
  Future<bool> isAuthenticated() async {
    final bool isAuthenticated =
        await _storage.read(key: "auth_token") == null ? false : true;
    return isAuthenticated;
  }

  Future<bool> logout() async {
    try {
      await _storage.delete(key: "auth_token");
      return true;
    } catch (err) {
      return false;
    }
  }
}

final secureStorage = SecureStorage();
