import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// shared preferences
class SharedPrefs {
  static SharedPreferences? _sharedPrefs;

  init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();

    // clear ephemeral data on startup
    _sharedPrefs?.remove('route_previous');
  }

  // utility
  void clearAll() {
    _sharedPrefs?.clear();
  }

  void readAll() {
    if (kDebugMode) {
      print('isLoggedIn: "$isLoggedIn"');
    }
  }

  void clearSession() {
    _sharedPrefs?.remove('company_name_current');
    _sharedPrefs?.remove('company_pk_current');
    _sharedPrefs?.remove('employee_pk_current');
  }

  void logout() {
    _sharedPrefs?.remove('is_logged_in');
  }

  // current company
  String get companyNameCurrent =>
      _sharedPrefs?.getString('company_name_current') ?? "";
  set companyNameCurrent(String val) {
    _sharedPrefs?.setString('company_name_current', val);
  }

  int get companyPkCurrent => _sharedPrefs?.getInt('company_pk_current') ?? 0;
  set companyPkCurrent(int val) {
    _sharedPrefs?.setInt('company_pk_current', val);
  }

  int get employeePkCurrent => _sharedPrefs?.getInt('employee_pk_current') ?? 0;
  set employeePkCurrent(int val) {
    _sharedPrefs?.setInt('employee_pk_current', val);
  }

  // routes
  // String get routeCurrent =>
  //   _sharedPrefs?.getString('route_current') ?? "";
  // set routeCurrent(String val) {
  //   _sharedPrefs?.setString('route_current', val);
  // }

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

  // isLoggedIn
  bool get isLoggedIn => _sharedPrefs?.getBool('is_logged_in') ?? false;
  set isLoggedIn(bool val) {
    _sharedPrefs?.setBool('is_logged_in', val);
  }
}

final SharedPrefs sharedPrefs = SharedPrefs();

// secure storage
class SecureStorage {
  init() async {}
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // crud
  Future write(String key, String val) async {
    var writeData = await _storage.write(key: key, value: val);
    return writeData;
  }

  Future read(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  Future readAll() async {
    return await _storage.readAll();
  }

  Future delete(String key) async {
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }

  Future clear() async {
    await _storage.deleteAll();
  }

  // computed properties
  Future<bool> isLoggedIn() async {
    final bool isLoggedIn =
        await _storage.read(key: "authToken") == null ? false : true;
    return isLoggedIn;
  }
}

final secureStorage = SecureStorage();
