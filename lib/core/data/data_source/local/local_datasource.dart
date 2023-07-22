import 'package:my_qoran/core/data/data_source/local/database/quran_database.dart';
import 'package:my_qoran/core/data/data_source/local/entities/juz_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/page_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/quran_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/search_result_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/surah_entity.dart';

class LocalDataSource {
  final QuranDatabase _database;
  LocalDataSource(this._database);

  Future<List<SurahView>> getSurahIndex() async {
    return _database.quranDao.showQuranIndexBySurah();
  }

  Future<List<JuzView>> getJuzIndex() async {
    return _database.quranDao.showQuranIndexByJuz();
  }

  Future<List<PageView>> getPageIndex() async {
    return _database.quranDao.showQuranIndexByPage();
  }

  Future<List<QuranEntity>> getSurahList() async {
    return _database.quranDao.getSurahList();
  }

  Future<List<QuranEntity>> getJuzList() async {
    return _database.quranDao.getJuzList();
  }

  Future<List<QuranEntity>> getPageList() async {
    return _database.quranDao.getPageList();
  }

  Future<List<SearchSurahResultView>> getSurahSearchResult(String query) async {
    return _database.quranDao.searchSurah(query);
  }

  Future<List<QuranEntity>> getQuranSearchResult(String query) {
    return _database.quranDao.searchEntireQuran(query);
  }

  Future<List<QuranEntity>> getQuranBySurahText(int surahNumber) {
    return _database.quranDao.readQuranBySurah(surahNumber);
  }

  Future<List<QuranEntity>> getQuranByJuzText(int juzNumber) {
    return _database.quranDao.readQuranByJuz(juzNumber);
  }

  Future<List<QuranEntity>> getQuranByPageText(int pageNumber) {
    return _database.quranDao.readQuranByPage(pageNumber);
  }
}
