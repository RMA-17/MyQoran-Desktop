part of 'quran_database.dart';

class QuranDao {
  final Database _db;
  const QuranDao(this._db);

  Future<List<SurahView>> showQuranIndexBySurah() async {
    final result = await _db.rawQuery(
      'SELECT * FROM surah',
    );

    return result
        .map((json) => SurahView(
              id: json['id'] as int?,
              ayahTotal: json['ayah_total'] as int?,
              surahNameAr: json['sora_name_ar'] as String?,
              surahNameEN: json['sora_name_en'] as String?,
              surahNameID: json['sora_name_id'] as String?,
              surahNumber: json['sora'] as int?,
              surahDescendText: json['sora_descend_place'] as String?,
            ))
        .toList();
  }

  Future<List<JuzView>> showQuranIndexByJuz() async {
    final result = await _db.rawQuery('SELECT * FROM juz');

    return result
        .map((json) => JuzView(
              ayahNumber: json['aya_no'] as int?,
              id: json['id'] as int?,
              juzNumber: json['jozz'] as int?,
              quranText: json['aya_text'] as String?,
              surahNameAr: json['sora_name_ar'] as String?,
              surahNameEn: json['sora_name_en'] as String?,
              surahNumber: json['sora'] as int?,
            ))
        .toList();
  }

  Future<List<PageView>> showQuranIndexByPage() async {
    final result = await _db.rawQuery('SELECT * FROM page');

    return result
        .map((json) => PageView(
              ayahNumber: json['aya_no'] as int?,
              id: json['id'] as int?,
              pageNumber: json['page'] as int?,
              surahNameAr: json['sora_name_ar'] as String?,
              surahNameEn: json['sora_name_en'] as String?,
              surahNumber: json['sora'] as int?,
            ))
        .toList();
  }

  Future<List<QuranEntity>> getSurahList() async {
    final result = await _db.rawQuery(
      'SELECT id, sora, sora_name_en FROM quran GROUP BY sora',
    );

    return result
        .map((json) => QuranEntity(
              id: json['id'] as int?,
              surahNumber: json['sora_number'] as int?,
              juzNumber: json['jozz'] as int?,
              pageNumber: json['page'] as int?,
              surahNameEn: json['sora_name_en'] as String?,
              surahNameAr: json['sora_name_ar'] as String?,
              ayahNumber: json['aya_no'] as int?,
              ayahText: json['aya_text'] as String?,
              ayahSearchText: json['aya_text_emlaey'] as String?,
              translationTextId: json['translation_id'] as String?,
              translationTextEn: json['translation_en'] as String?,
              footnotesTextId: json['footnotes_id'] as String?,
              surahNameId: json['sora_name_id'] as String?,
              surahDescendText: json['sora_descend_place'] as String?,
              surahNameSearchText: json['sora_name_emlaey'] as String?,
              footnotesTextEn: json['footnotes_en'] as String?,
            ))
        .toList();
  }

  Future<List<QuranEntity>> getJuzList() async {
    final result = await _db.rawQuery(
      'SELECT id, jozz FROM quran GROUP BY jozz',
    );

    return result
        .map((json) => QuranEntity(
              id: json['id'] as int?,
              surahNumber: json['sora_number'] as int?,
              juzNumber: json['jozz'] as int?,
              pageNumber: json['page'] as int?,
              surahNameEn: json['sora_name_en'] as String?,
              surahNameAr: json['sora_name_ar'] as String?,
              ayahNumber: json['aya_no'] as int?,
              ayahText: json['aya_text'] as String?,
              ayahSearchText: json['aya_text_emlaey'] as String?,
              translationTextId: json['translation_id'] as String?,
              translationTextEn: json['translation_en'] as String?,
              footnotesTextId: json['footnotes_id'] as String?,
              surahNameId: json['sora_name_id'] as String?,
              surahDescendText: json['sora_descend_place'] as String?,
              surahNameSearchText: json['sora_name_emlaey'] as String?,
              footnotesTextEn: json['footnotes_en'] as String?,
            ))
        .toList();
  }

  Future<List<QuranEntity>> getPageList() async {
    final result = await _db.rawQuery(
      'SELECT id, page FROM quran GROUP BY page',
    );

    return result
        .map((json) => QuranEntity(
              id: json['id'] as int?,
              surahNumber: json['sora_number'] as int?,
              juzNumber: json['jozz'] as int?,
              pageNumber: json['page'] as int?,
              surahNameEn: json['sora_name_en'] as String?,
              surahNameAr: json['sora_name_ar'] as String?,
              ayahNumber: json['aya_no'] as int?,
              ayahText: json['aya_text'] as String?,
              ayahSearchText: json['aya_text_emlaey'] as String?,
              translationTextId: json['translation_id'] as String?,
              translationTextEn: json['translation_en'] as String?,
              footnotesTextId: json['footnotes_id'] as String?,
              surahNameId: json['sora_name_id'] as String?,
              surahDescendText: json['sora_descend_place'] as String?,
              surahNameSearchText: json['sora_name_emlaey'] as String?,
              footnotesTextEn: json['footnotes_en'] as String?,
            ))
        .toList();
  }

  Future<List<SearchSurahResultView>> searchSurah(String search) async {
    final result = await _db.rawQuery(
      'SELECT * FROM search_surah_result WHERE sora_name_emlaey LIKE \'%\'||?1||\'%\' OR sora = \'%\'||?1||\'%\' GROUP BY sora',
    );

    return result
        .map((json) => SearchSurahResultView(
              id: json['id'] as int?,
              numberOfAyah: json['ayah_total'] as int?,
              surahNameAr: json['sora_name_ar'] as String?,
              surahNameEmlaey: json['sora_name_emlaey'] as String?,
              surahNameEn: json['sora_name_en'] as String?,
              surahNameId: json['sora_name_id'] as String?,
              surahNumber: json['sora'] as int?,
              turunSurah: json['sora_descend_place'] as String?,
            ))
        .toList();
  }

  Future<List<QuranEntity>> searchEntireQuran(String search) async {
    final result = await _db.rawQuery(
      "SELECT * FROM quran WHERE translation_id LIKE '%'||:search||'%' OR aya_text_emlaey LIKE :search OR translation_en LIKE '%'||:search||'%'",
    );

    return result
        .map((json) => QuranEntity(
              id: json['id'] as int?,
              surahNumber: json['sora_number'] as int?,
              juzNumber: json['jozz'] as int?,
              pageNumber: json['page'] as int?,
              surahNameEn: json['sora_name_en'] as String?,
              surahNameAr: json['sora_name_ar'] as String?,
              ayahNumber: json['aya_no'] as int?,
              ayahText: json['aya_text'] as String?,
              ayahSearchText: json['aya_text_emlaey'] as String?,
              translationTextId: json['translation_id'] as String?,
              translationTextEn: json['translation_en'] as String?,
              footnotesTextId: json['footnotes_id'] as String?,
              surahNameId: json['sora_name_id'] as String?,
              surahDescendText: json['sora_descend_place'] as String?,
              surahNameSearchText: json['sora_name_emlaey'] as String?,
              footnotesTextEn: json['footnotes_en'] as String?,
            ))
        .toList();
  }

  Future<List<QuranEntity>> readQuranBySurah(int surahNumber) async {
    final result = await _db.rawQuery(
      "SELECT id, sora, aya_no, aya_text, aya_text_emlaey, translation_id, sora_name_ar, sora_name_en, footnotes_id, translation_en, footnotes_en, sora_descend_place FROM quran WHERE sora = :surahNumber",
    );

    return result
        .map((json) => QuranEntity(
            id: json['id'] as int?,
            surahNumber: json['sora_number'] as int?,
            juzNumber: json['jozz'] as int?,
            pageNumber: json['page'] as int?,
            surahNameEn: json['sora_name_en'] as String?,
            surahNameAr: json['sora_name_ar'] as String?,
            ayahNumber: json['aya_no'] as int?,
            ayahText: json['aya_text'] as String?,
            ayahSearchText: json['aya_text_emlaey'] as String?,
            translationTextId: json['translation_id'] as String?,
            translationTextEn: json['translation_en'] as String?,
            footnotesTextId: json['footnotes_id'] as String?,
            surahNameId: json['sora_name_id'] as String?,
            surahDescendText: json['sora_descend_place'] as String?,
            surahNameSearchText: json['sora_name_emlaey'] as String?,
            footnotesTextEn: json['footnotes_en'] as String?))
        .toList();
  }

  Future<List<QuranEntity>> readQuranByJuz(int juzNumber) async {
    final result = await _db.rawQuery(
      "SELECT id, sora, jozz, aya_no, aya_text, aya_text_emlaey, translation_id, sora_name_ar, sora_name_en, footnotes_id, translation_en, footnotes_en, sora_descend_place FROM quran WHERE jozz = :juzNumber",
    );

    return result
        .map((json) => QuranEntity(
              id: json['id'] as int?,
              surahNumber: json['sora_number'] as int?,
              juzNumber: json['jozz'] as int?,
              pageNumber: json['page'] as int?,
              surahNameEn: json['sora_name_en'] as String?,
              surahNameAr: json['sora_name_ar'] as String?,
              ayahNumber: json['aya_no'] as int?,
              ayahText: json['aya_text'] as String?,
              ayahSearchText: json['aya_text_emlaey'] as String?,
              translationTextId: json['translation_id'] as String?,
              translationTextEn: json['translation_en'] as String?,
              footnotesTextId: json['footnotes_id'] as String?,
              surahNameId: json['sora_name_id'] as String?,
              surahDescendText: json['sora_descend_place'] as String?,
              surahNameSearchText: json['sora_name_emlaey'] as String?,
              footnotesTextEn: json['footnotes_en'] as String?,
            ))
        .toList();
  }

  Future<List<QuranEntity>> readQuranByPage(int pageNumber) async {
    final result = await _db.rawQuery(
      "SELECT id, sora, jozz, aya_no, page, aya_text, aya_text_emlaey, translation_id, sora_name_ar, sora_name_en, footnotes_id, translation_en, footnotes_en, sora_descend_place FROM quran WHERE page = :pageNumber",
    );

    return result
        .map((json) => QuranEntity(
              id: json['id'] as int?,
              surahNumber: json['sora_number'] as int?,
              juzNumber: json['jozz'] as int?,
              pageNumber: json['page'] as int?,
              surahNameEn: json['sora_name_en'] as String?,
              surahNameAr: json['sora_name_ar'] as String?,
              ayahNumber: json['aya_no'] as int?,
              ayahText: json['aya_text'] as String?,
              ayahSearchText: json['aya_text_emlaey'] as String?,
              translationTextId: json['translation_id'] as String?,
              translationTextEn: json['translation_en'] as String?,
              footnotesTextId: json['footnotes_id'] as String?,
              surahNameId: json['sora_name_id'] as String?,
              surahDescendText: json['sora_descend_place'] as String?,
              surahNameSearchText: json['sora_name_emlaey'] as String?,
              footnotesTextEn: json['footnotes_en'] as String?,
            ))
        .toList();
  }
}
