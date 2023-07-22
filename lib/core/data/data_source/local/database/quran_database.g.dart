// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorQuranDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$QuranDatabaseBuilder databaseBuilder(String name) =>
      _$QuranDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$QuranDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$QuranDatabaseBuilder(null);
}

class _$QuranDatabaseBuilder {
  _$QuranDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$QuranDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$QuranDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<QuranDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$QuranDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$QuranDatabase extends QuranDatabase {
  _$QuranDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  QuranDao? _quranDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `quran` (`id` INTEGER, `sora_number` INTEGER, `jozz` INTEGER, `page` INTEGER, `sora_name_en` TEXT, `sora_name_ar` TEXT, `aya_no` INTEGER, `aya_text` TEXT, `aya_text_emlaey` TEXT, `translation_id` TEXT, `translation_en` TEXT, `footnotes_id` TEXT, `sora_name_id` TEXT, `sora_descend_place` TEXT, `sora_name_emlaey` TEXT, `footnotes_en` TEXT, PRIMARY KEY (`id`))');

        await database.execute(
            'CREATE VIEW IF NOT EXISTS `surah` AS SELECT id, sora, sora_name_ar, sora_name_en, sora_name_id, COUNT(id) as ayah_total, sora_descend_place FROM quran GROUP by sora');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `page` AS SELECT MIN(id) as id, page, sora, aya_no, sora_name_en, sora_name_ar FROM quran GROUP by page ORDER BY id');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `juz` AS SELECT MIN(id) AS id, jozz, sora, aya_text, sora_name_ar, sora_name_en, aya_no FROM quran GROUP BY jozz ORDER BY id ASC');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `search_surah_result` AS SELECT sora, sora_name_ar, sora_name_en, sora_name_id, sora_name_emlaey, COUNT(id) as ayah_total, sora_descend_place FROM quran GROUP by sora');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  QuranDao get quranDao {
    return _quranDaoInstance ??= _$QuranDao(database, changeListener);
  }
}

class _$QuranDao extends QuranDao {
  _$QuranDao(
    this.database,
    this.changeListener,
  ) : _queryAdapter = QueryAdapter(database);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  @override
  Future<List<SurahView>> showQuranIndexBySurah() async {
    return _queryAdapter.queryList('SELECT * FROM surah',
        mapper: (Map<String, Object?> row) => SurahView(
            id: row['id'] as int?,
            ayahTotal: row['ayah_total'] as int?,
            surahNameAr: row['sora_name_ar'] as String?,
            surahNameEN: row['sora_name_en'] as String?,
            surahNameID: row['sora_name_id'] as String?,
            surahNumber: row['sora'] as int?,
            surahDescendText: row['sora_descend_place'] as String?));
  }

  @override
  Future<List<JuzView>> showQuranIndexByJuz() async {
    return _queryAdapter.queryList('SELECT * FROM juz',
        mapper: (Map<String, Object?> row) => JuzView(
            ayahNumber: row['aya_no'] as int?,
            id: row['id'] as int?,
            juzNumber: row['jozz'] as int?,
            quranText: row['aya_text'] as String?,
            surahNameAr: row['sora_name_ar'] as String?,
            surahNameEn: row['sora_name_en'] as String?,
            surahNumber: row['sora'] as int?));
  }

  @override
  Future<List<PageView>> showQuranIndexByPage() async {
    return _queryAdapter.queryList('SELECT * FROM page',
        mapper: (Map<String, Object?> row) => PageView(
            ayahNumber: row['aya_no'] as int?,
            id: row['id'] as int?,
            pageNumber: row['page'] as int?,
            surahNameAr: row['sora_name_ar'] as String?,
            surahNameEn: row['sora_name_en'] as String?,
            surahNumber: row['sora'] as int?));
  }

  @override
  Future<List<QuranEntity>> getSurahList() async {
    return _queryAdapter.queryList(
        'SELECT id, sora, sora_name_en FROM quran GROUP BY sora',
        mapper: (Map<String, Object?> row) => QuranEntity(
            id: row['id'] as int?,
            surahNumber: row['sora_number'] as int?,
            juzNumber: row['jozz'] as int?,
            pageNumber: row['page'] as int?,
            surahNameEn: row['sora_name_en'] as String?,
            surahNameAr: row['sora_name_ar'] as String?,
            ayahNumber: row['aya_no'] as int?,
            ayahText: row['aya_text'] as String?,
            ayahSearchText: row['aya_text_emlaey'] as String?,
            translationTextId: row['translation_id'] as String?,
            translationTextEn: row['translation_en'] as String?,
            footnotesTextId: row['footnotes_id'] as String?,
            surahNameId: row['sora_name_id'] as String?,
            surahDescendText: row['sora_descend_place'] as String?,
            surahNameSearchText: row['sora_name_emlaey'] as String?,
            footnotesTextEn: row['footnotes_en'] as String?));
  }

  @override
  Future<List<QuranEntity>> getJuzList() async {
    return _queryAdapter.queryList('SELECT id, jozz FROM quran GROUP BY jozz',
        mapper: (Map<String, Object?> row) => QuranEntity(
            id: row['id'] as int?,
            surahNumber: row['sora_number'] as int?,
            juzNumber: row['jozz'] as int?,
            pageNumber: row['page'] as int?,
            surahNameEn: row['sora_name_en'] as String?,
            surahNameAr: row['sora_name_ar'] as String?,
            ayahNumber: row['aya_no'] as int?,
            ayahText: row['aya_text'] as String?,
            ayahSearchText: row['aya_text_emlaey'] as String?,
            translationTextId: row['translation_id'] as String?,
            translationTextEn: row['translation_en'] as String?,
            footnotesTextId: row['footnotes_id'] as String?,
            surahNameId: row['sora_name_id'] as String?,
            surahDescendText: row['sora_descend_place'] as String?,
            surahNameSearchText: row['sora_name_emlaey'] as String?,
            footnotesTextEn: row['footnotes_en'] as String?));
  }

  @override
  Future<List<QuranEntity>> getPageList() async {
    return _queryAdapter.queryList('SELECT id, page FROM quran GROUP BY page',
        mapper: (Map<String, Object?> row) => QuranEntity(
            id: row['id'] as int?,
            surahNumber: row['sora_number'] as int?,
            juzNumber: row['jozz'] as int?,
            pageNumber: row['page'] as int?,
            surahNameEn: row['sora_name_en'] as String?,
            surahNameAr: row['sora_name_ar'] as String?,
            ayahNumber: row['aya_no'] as int?,
            ayahText: row['aya_text'] as String?,
            ayahSearchText: row['aya_text_emlaey'] as String?,
            translationTextId: row['translation_id'] as String?,
            translationTextEn: row['translation_en'] as String?,
            footnotesTextId: row['footnotes_id'] as String?,
            surahNameId: row['sora_name_id'] as String?,
            surahDescendText: row['sora_descend_place'] as String?,
            surahNameSearchText: row['sora_name_emlaey'] as String?,
            footnotesTextEn: row['footnotes_en'] as String?));
  }

  @override
  Future<List<SearchSurahResultView>> searchSurah(String search) async {
    return _queryAdapter.queryList(
        'SELECT * FROM search_surah_result WHERE sora_name_emlaey LIKE \'%\'||?1||\'%\' OR sora = \'%\'||?1||\'%\' GROUP BY sora',
        mapper: (Map<String, Object?> row) => SearchSurahResultView(id: row['id'] as int?, numberOfAyah: row['ayah_total'] as int?, surahNameAr: row['sora_name_ar'] as String?, surahNameEmlaey: row['sora_name_emlaey'] as String?, surahNameEn: row['sora_name_en'] as String?, surahNameId: row['sora_name_id'] as String?, surahNumber: row['sora'] as int?, turunSurah: row['sora_descend_place'] as String?),
        arguments: [search]);
  }

  @override
  Future<List<QuranEntity>> searchEntireQuran(String search) async {
    return _queryAdapter.queryList(
        'SELECT * FROM quran WHERE translation_id LIKE \'%\'||?1||\'%\' OR aya_text_emlaey LIKE ?1 OR translation_en LIKE \'%\'||?1||\'%\'',
        mapper: (Map<String, Object?> row) => QuranEntity(id: row['id'] as int?, surahNumber: row['sora_number'] as int?, juzNumber: row['jozz'] as int?, pageNumber: row['page'] as int?, surahNameEn: row['sora_name_en'] as String?, surahNameAr: row['sora_name_ar'] as String?, ayahNumber: row['aya_no'] as int?, ayahText: row['aya_text'] as String?, ayahSearchText: row['aya_text_emlaey'] as String?, translationTextId: row['translation_id'] as String?, translationTextEn: row['translation_en'] as String?, footnotesTextId: row['footnotes_id'] as String?, surahNameId: row['sora_name_id'] as String?, surahDescendText: row['sora_descend_place'] as String?, surahNameSearchText: row['sora_name_emlaey'] as String?, footnotesTextEn: row['footnotes_en'] as String?),
        arguments: [search]);
  }

  @override
  Future<List<QuranEntity>> readQuranBySurah(int surahNumber) async {
    return _queryAdapter.queryList(
        'SELECT id, sora, jozz, aya_no, aya_text, aya_text_emlaey, translation_id, sora_name_ar, sora_name_en, footnotes_id, translation_en, footnotes_en, sora_descend_place FROM quran WHERE sora = ?1',
        mapper: (Map<String, Object?> row) => QuranEntity(id: row['id'] as int?, surahNumber: row['sora_number'] as int?, juzNumber: row['jozz'] as int?, pageNumber: row['page'] as int?, surahNameEn: row['sora_name_en'] as String?, surahNameAr: row['sora_name_ar'] as String?, ayahNumber: row['aya_no'] as int?, ayahText: row['aya_text'] as String?, ayahSearchText: row['aya_text_emlaey'] as String?, translationTextId: row['translation_id'] as String?, translationTextEn: row['translation_en'] as String?, footnotesTextId: row['footnotes_id'] as String?, surahNameId: row['sora_name_id'] as String?, surahDescendText: row['sora_descend_place'] as String?, surahNameSearchText: row['sora_name_emlaey'] as String?, footnotesTextEn: row['footnotes_en'] as String?),
        arguments: [surahNumber]);
  }

  @override
  Future<List<QuranEntity>> readQuranByJuz(int juzNumber) async {
    return _queryAdapter.queryList(
        'SELECT id, sora, jozz, aya_no, aya_text, aya_text_emlaey, translation_id, sora_name_ar, sora_name_en, footnotes_id, translation_en, footnotes_en, sora_descend_place FROM quran WHERE jozz = ?1',
        mapper: (Map<String, Object?> row) => QuranEntity(id: row['id'] as int?, surahNumber: row['sora_number'] as int?, juzNumber: row['jozz'] as int?, pageNumber: row['page'] as int?, surahNameEn: row['sora_name_en'] as String?, surahNameAr: row['sora_name_ar'] as String?, ayahNumber: row['aya_no'] as int?, ayahText: row['aya_text'] as String?, ayahSearchText: row['aya_text_emlaey'] as String?, translationTextId: row['translation_id'] as String?, translationTextEn: row['translation_en'] as String?, footnotesTextId: row['footnotes_id'] as String?, surahNameId: row['sora_name_id'] as String?, surahDescendText: row['sora_descend_place'] as String?, surahNameSearchText: row['sora_name_emlaey'] as String?, footnotesTextEn: row['footnotes_en'] as String?),
        arguments: [juzNumber]);
  }

  @override
  Future<List<QuranEntity>> readQuranByPage(int pageNumber) async {
    return _queryAdapter.queryList(
        'SELECT id, sora, jozz, aya_no, page,aya_text, aya_text_emlaey, translation_id, sora_name_ar, sora_name_en, footnotes_id, translation_en, footnotes_en, sora_descend_place FROM quran WHERE page = ?1',
        mapper: (Map<String, Object?> row) => QuranEntity(id: row['id'] as int?, surahNumber: row['sora_number'] as int?, juzNumber: row['jozz'] as int?, pageNumber: row['page'] as int?, surahNameEn: row['sora_name_en'] as String?, surahNameAr: row['sora_name_ar'] as String?, ayahNumber: row['aya_no'] as int?, ayahText: row['aya_text'] as String?, ayahSearchText: row['aya_text_emlaey'] as String?, translationTextId: row['translation_id'] as String?, translationTextEn: row['translation_en'] as String?, footnotesTextId: row['footnotes_id'] as String?, surahNameId: row['sora_name_id'] as String?, surahDescendText: row['sora_descend_place'] as String?, surahNameSearchText: row['sora_name_emlaey'] as String?, footnotesTextEn: row['footnotes_en'] as String?),
        arguments: [pageNumber]);
  }
}
