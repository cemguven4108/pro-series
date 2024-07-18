import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _lastIndexKey = 'last_index';

  Future<int?> getLastIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_lastIndexKey);
  }

  Future<void> saveLastIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lastIndexKey, index);
  }
}
