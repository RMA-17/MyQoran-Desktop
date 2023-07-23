import 'package:my_qoran/core/data/data_source/local/entities/quran_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/search_result_entity.dart';
import 'package:my_qoran/core/data/states/data_state.dart';
import 'package:my_qoran/core/domain/model/index/juz_index_model.dart';
import 'package:my_qoran/core/domain/model/index/page_index_model.dart';
import 'package:my_qoran/core/domain/model/index/surah_index_model.dart';
import 'package:my_qoran/core/domain/model/listing/juz_listing.dart';
import 'package:my_qoran/core/domain/model/listing/page_listing.dart';
import 'package:my_qoran/core/domain/model/listing/surah_listing.dart';
import 'package:my_qoran/core/domain/model/read/juz_read_model.dart';
import 'package:my_qoran/core/domain/model/read/page_read_model.dart';
import 'package:my_qoran/core/domain/model/read/surah_read_model.dart';
import 'package:my_qoran/core/domain/model/search/search_ayah_model.dart';
import 'package:my_qoran/core/domain/model/search/search_surah_model.dart';

abstract class QuranRepository {
  Future<DataState<List<SurahIndex>>> getSurahIndex();

  Future<DataState<List<JuzIndex>>> getJuzIndex();

  Future<DataState<List<PageIndex>>> getPageIndex();

  Future<DataState<List<SurahListing>>> getSurahList();

  Future<DataState<List<JuzListing>>> getJuzList();

  Future<DataState<List<PageListing>>> getPageList();

  Future<DataState<List<SurahSearchResult>>> getSurahSearchResult(
    String query,
  );

  Future<DataState<List<AyahSearchResult>>> getAyahSearchResult(String query);

  Future<DataState<List<SurahRead>>> getQuranBySurahText(int surahNumber);

  Future<DataState<List<JuzRead>>> getQuranByJuzText(int juzNumber);

  Future<DataState<List<PageRead>>> getQuranByPageText(int pageNumber);
}
