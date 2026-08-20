import 'package:shared_preferences/shared_preferences.dart';

class GameSettings {
  GameSettings({this.sound = true, this.ai = true, this.difficulty = 2});
  bool sound;
  bool ai;
  int difficulty;

  static Future<GameSettings> load() async {
    final p = await SharedPreferences.getInstance();
    return GameSettings(
      sound: p.getBool('nemda_sound') ?? true,
      ai: p.getBool('nemda_ai') ?? true,
      difficulty: p.getInt('nemda_difficulty') ?? 2,
    );
  }

  Future<void> save() async {
    final p = await SharedPreferences.getInstance();
    await p.setBool('nemda_sound', sound);
    await p.setBool('nemda_ai', ai);
    await p.setInt('nemda_difficulty', difficulty);
  }
}
