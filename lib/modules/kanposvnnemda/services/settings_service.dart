import 'package:shared_preferences/shared_preferences.dart';

class GameSettings {
  GameSettings({this.sound = true, this.ai = true, this.difficulty = 2, this.showTrajectory = true});
  bool sound;
  bool ai;
  int difficulty;
  bool showTrajectory;

  static Future<GameSettings> load() async {
    final p = await SharedPreferences.getInstance();
    return GameSettings(
      sound: p.getBool('nemda_sound') ?? true,
      ai: p.getBool('nemda_ai') ?? true,
      difficulty: p.getInt('nemda_difficulty') ?? 2,
      showTrajectory: p.getBool('nemda_showTrajectory') ?? true,
    );
  }

  Future<void> save() async {
    final p = await SharedPreferences.getInstance();
    await p.setBool('nemda_sound', sound);
    await p.setBool('nemda_ai', ai);
    await p.setInt('nemda_difficulty', difficulty);
    await p.setBool('nemda_showTrajectory', showTrajectory);
  }
}
