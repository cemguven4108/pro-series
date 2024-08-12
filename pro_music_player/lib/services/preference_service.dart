import 'package:pro_music_player/models/preference_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  static const _lastIndexKey = 'last_index';
  static const _lastPosition = 'last_position';

  Future<PreferenceModel> getPlayerPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    return PreferenceModel(
      lastIndex: prefs.getInt(_lastIndexKey),
      lastPosition: prefs.getDouble(_lastPosition),
    );
  }

  Future<void> setPlayerPreferences(PreferenceModel model) async {
    _setLastIndex(index: model.lastIndex);
    _setLastPosition(position: model.lastPosition);
  }

  void _setLastIndex({int? index}) async {
    if (index == null) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lastIndexKey, index);
  }

  void _setLastPosition({double? position}) async {
    if (position == null) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_lastPosition, position);
  }

  Future<void> clearPlayerPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_lastIndexKey);
    await prefs.remove(_lastPosition);
  }
}
