import 'package:my_qoran/core/data/data_source/local/database/quran_database.dart';
import 'package:my_qoran/core/data/data_source/local/entities/juz_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/page_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/quran_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/search_result_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/surah_entity.dart';

class LocalDataSource {
  final QuranDatabase _quranDatabase;
  LocalDataSource(this._quranDatabase);

  Future<List<SurahView>> getSurahIndex() async {
    return QuranDao(await _quranDatabase.database).showQuranIndexBySurah();
  }

  Future<List<JuzView>> getJuzIndex() async {
    return QuranDao(await _quranDatabase.database).showQuranIndexByJuz();
  }

  Future<List<PageView>> getPageIndex() async {
    return QuranDao(await _quranDatabase.database).showQuranIndexByPage();
  }

  Future<List<QuranEntity>> getSurahList() async {
    return QuranDao(await _quranDatabase.database).getSurahList();
  }

  Future<List<QuranEntity>> getJuzList() async {
    return QuranDao(await _quranDatabase.database).getJuzList();
  }

  Future<List<QuranEntity>> getPageList() async {
    return QuranDao(await _quranDatabase.database).getPageList();
  }

  Future<List<SearchSurahResultView>> getSurahSearchResult(String query) async {
    return QuranDao(await _quranDatabase.database).searchSurah(query);
  }

  Future<List<QuranEntity>> getQuranSearchResult(String query) async {
    return QuranDao(await _quranDatabase.database).searchEntireQuran(query);
  }

  Future<List<QuranEntity>> getQuranBySurahText(int surahNumber) async {
    return QuranDao(await _quranDatabase.database)
        .readQuranBySurah(surahNumber);
  }

  Future<List<QuranEntity>> getQuranByJuzText(int juzNumber) async {
    return QuranDao(await _quranDatabase.database).readQuranByJuz(juzNumber);
  }

  Future<List<QuranEntity>> getQuranByPageText(int pageNumber) async {
    return QuranDao(await _quranDatabase.database).readQuranByPage(pageNumber);
  }
}
