import 'package:shared_preferences/shared_preferences.dart';

import './local_storage_interface.dart';

class LocalStorageService implements ILocalStorage {
  @override
  Future delete(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.remove(key);
  }

  @override
  Future get(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future set(String key, value) async {
    var shared = await SharedPreferences.getInstance();
    if (value is bool)
      shared.setBool(key, value);
    else if (value is String)
      shared.setString(key, value);
    else if (value is int)
      shared.setInt(key, value);
    else if (value is double)
      shared.setDouble(key, value);
    else if (value is List<String>)
      shared.setStringList(key, value);
    else
      throw new TypeError();
  }
}
