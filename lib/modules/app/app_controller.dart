import './local_storage_interface.dart';

class AppController {
  final ILocalStorage storage;
  AppController(this.storage);

  Future<void> setTheme(bool isDark) async {
    await storage.set('isDark', isDark);
  }

  Future<bool> getTheme(String key) async {
    var theme = await storage.get(key);
    return theme;
  }
}
