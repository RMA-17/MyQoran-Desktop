import 'package:my_qoran/core/data/data_source/local/entities/juz_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/page_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/quran_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/search_result_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/surah_entity.dart';
import 'package:my_qoran/core/data/states/data_state.dart';

abstract class QuranRepository {
  Future<DataState<List<SurahView>>> getSurahIndex();

  Future<DataState<List<JuzView>>> getJuzIndex();

  Future<DataState<List<PageView>>> getPageIndex();

  Future<DataState<List<QuranEntity>>> getSurahList();

  Future<DataState<List<QuranEntity>>> getJuzList();

  Future<DataState<List<QuranEntity>>> getPageList();

  Future<DataState<List<SearchSurahResultView>>> getSurahSearchResult(
    String query,
  );

  Future<DataState<List<QuranEntity>>> getQuranSearchResult(String query);

  Future<DataState<List<QuranEntity>>> getQuranBySurahText(int surahNumber);

  Future<DataState<List<QuranEntity>>> getQuranByJuzText(int juzNumber);

  Future<DataState<List<QuranEntity>>> getQuranByPageText(int pageNumber);
}
