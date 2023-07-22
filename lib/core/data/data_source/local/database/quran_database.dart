import 'package:floor/floor.dart';
import 'package:my_qoran/core/data/data_source/local/entities/juz_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/page_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/quran_entity.dart';
import 'package:my_qoran/core/data/data_source/local/database/quran_dao.dart';
import 'package:my_qoran/core/data/data_source/local/entities/search_result_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/surah_entity.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'quran_database.g.dart';

@Database(
  version: 2,
  entities: [QuranEntity],
  views: [SurahView, PageView, JuzView, SearchSurahResultView],
)
abstract class QuranDatabase extends FloorDatabase {
  QuranDao get quranDao;
}
