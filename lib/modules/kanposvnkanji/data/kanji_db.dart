import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:flutter/services.dart';
import '../models/kanji_model.dart';

class KanjiDb {
  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = Isar.open([KanjiModel.schema], directory: dir.path);
  }

  static List<Map<String, dynamic>> getKanjiSeedData() async {
    final assetBundle = rootBundle;
    final jsonString = await assetBundle.loadString('assets/kanji_seed_data.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    
    return jsonList.map((json) {
      final kanji = KanjiModel.fromJson(json);
      return {
        'id': kanji.id,
        'kanji': kanji.kanji,
        'reading': kanji.reading,
        'hanviet': kanji.hanviet,
        'level': kanji.level,
      };
    }).toList();
  }
}