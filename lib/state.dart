import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
