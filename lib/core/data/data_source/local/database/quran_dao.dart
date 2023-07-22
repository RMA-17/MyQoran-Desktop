import 'package:floor/floor.dart';
import 'package:my_qoran/core/data/data_source/local/entities/juz_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/page_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/quran_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/search_result_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/surah_entity.dart';
import 'dart:async';

@dao
abstract class QuranDao {
  @Query("SELECT * FROM surah")
  Future<List<SurahView>> showQuranIndexBySurah();

  @Query("SELECT * FROM juz")
  Future<List<JuzView>> showQuranIndexByJuz();

  @Query("SELECT * FROM page")
  Future<List<PageView>> showQuranIndexByPage();

  @Query("SELECT id, sora, sora_name_en FROM quran GROUP BY sora")
  Future<List<QuranEntity>> getSurahList();

  @Query("SELECT id, jozz FROM quran GROUP BY jozz")
  Future<List<QuranEntity>> getJuzList();

  @Query("SELECT id, page FROM quran GROUP BY page")
  Future<List<QuranEntity>> getPageList();

  @Query(
      "SELECT * FROM search_surah_result WHERE sora_name_emlaey LIKE '%'||:search||'%' OR sora = '%'||:search||'%' GROUP BY sora")
  Future<List<SearchSurahResultView>> searchSurah(String search);

  @Query(
      "SELECT * FROM quran WHERE translation_id LIKE '%'||:search||'%' OR aya_text_emlaey LIKE :search OR translation_en LIKE '%'||:search||'%'")
  Future<List<QuranEntity>> searchEntireQuran(String search);

  @Query(
    "SELECT id, sora, aya_no, aya_text, aya_text_emlaey, translation_id, sora_name_ar, sora_name_en, footnotes_id, translation_en, footnotes_en, sora_descend_place FROM quran WHERE sora = :surahNumber",
  )
  Future<List<QuranEntity>> readQuranBySurah(int surahNumber);

  @Query(
    "SELECT id, sora, jozz, aya_no, aya_text, aya_text_emlaey, translation_id, sora_name_ar, sora_name_en, footnotes_id, translation_en, footnotes_en, sora_descend_place FROM quran WHERE jozz = :juzNumber",
  )
  Future<List<QuranEntity>> readQuranByJuz(int juzNumber);

  @Query(
    "SELECT id, sora, jozz, aya_no, page, aya_text, aya_text_emlaey, translation_id, sora_name_ar, sora_name_en, footnotes_id, translation_en, footnotes_en, sora_descend_place FROM quran WHERE page = :pageNumber",
  )
  Future<List<QuranEntity>> readQuranByPage(int pageNumber);
}
