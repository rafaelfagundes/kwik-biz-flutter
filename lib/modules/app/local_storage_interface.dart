abstract class ILocalStorage {
  Future get(String key);
  Future delete(String key);
  Future set(String key, dynamic value);
}
