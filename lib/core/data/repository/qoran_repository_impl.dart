import 'package:flutter/foundation.dart';
import 'package:my_qoran/core/data/data_source/local/entities/juz_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/page_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/quran_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/search_result_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/surah_entity.dart';
import 'package:my_qoran/core/data/data_source/local/local_datasource.dart';
import 'package:my_qoran/core/data/states/data_state.dart';
import 'package:my_qoran/core/domain/repository/qoran_repository.dart';

class QuranRepositoryImpl implements QuranRepository {
  final LocalDataSource _localDataSource;
  QuranRepositoryImpl(this._localDataSource);

  @override
  Future<DataState<List<JuzView>>> getJuzIndex() async {
    try {
      final data = await _localDataSource.getJuzIndex();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<QuranEntity>>> getJuzList() async {
    try {
      final data = await _localDataSource.getJuzList();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<PageView>>> getPageIndex() async {
    try {
      final data = await _localDataSource.getPageIndex();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<QuranEntity>>> getPageList() async {
    try {
      final data = await _localDataSource.getPageList();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<QuranEntity>>> getQuranByJuzText(int juzNumber) async {
    try {
      final data = await _localDataSource.getQuranByJuzText(juzNumber);
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<QuranEntity>>> getQuranByPageText(
    int pageNumber,
  ) async {
    try {
      final data = await _localDataSource.getQuranByPageText(pageNumber);
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<QuranEntity>>> getQuranBySurahText(
    int surahNumber,
  ) async {
    try {
      final data = await _localDataSource.getQuranBySurahText(surahNumber);
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<QuranEntity>>> getQuranSearchResult(
    String query,
  ) async {
    try {
      final data = await _localDataSource.getQuranSearchResult(query);
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<SurahView>>> getSurahIndex() async {
    try {
      final data = await _localDataSource.getSurahIndex();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<QuranEntity>>> getSurahList() async {
    try {
      final data = await _localDataSource.getSurahList();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<SearchSurahResultView>>> getSurahSearchResult(
    String query,
  ) async {
    try {
      final data = await _localDataSource.getSurahSearchResult(query);
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }
}
