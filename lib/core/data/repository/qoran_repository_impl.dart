import 'package:flutter/foundation.dart';
import 'package:my_qoran/core/data/data_source/local/local_datasource.dart';
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
import 'package:my_qoran/core/domain/repository/qoran_repository.dart';

class QuranRepositoryImpl implements QuranRepository {
  final LocalDataSource _localDataSource;
  QuranRepositoryImpl(this._localDataSource);

  @override
  Future<DataState<List<JuzIndex>>> getJuzIndex() async {
    try {
      final dataList = await _localDataSource.getJuzIndex();
      final data = dataList
          .map((item) => JuzIndex(
                ayahNumber: item.ayahNumber,
                id: item.id,
                juzNumber: item.juzNumber,
              ))
          .toList();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<JuzListing>>> getJuzList() async {
    try {
      final dataList = await _localDataSource.getJuzList();
      final data = dataList
          .map((item) => JuzListing(
                id: item.id,
                juzNumber: item.juzNumber,
              ))
          .toList();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<PageIndex>>> getPageIndex() async {
    try {
      final dataList = await _localDataSource.getPageIndex();
      final data = dataList
          .map((item) => PageIndex(
                id: item.id,
                pageNumber: item.pageNumber,
              ))
          .toList();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<PageListing>>> getPageList() async {
    try {
      final dataList = await _localDataSource.getPageList();
      final data = dataList
          .map((item) => PageListing(
                id: item.id,
                pageNumber: item.pageNumber,
              ))
          .toList();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<JuzRead>>> getQuranByJuzText(int juzNumber) async {
    try {
      final dataList = await _localDataSource.getQuranByJuzText(juzNumber);
      final data = dataList
          .map((item) => JuzRead(
                id: item.id,
                ayahNumber: item.ayahNumber,
                ayahSearchText: item.ayahSearchText,
                ayahText: item.ayahText,
                footnotesEn: item.footnotesTextEn,
                footnotesId: item.footnotesTextId,
                juzNumber: item.juzNumber,
                surahDescendPlace: item.surahDescendText,
                surahNameAr: item.surahNameAr,
                surahNameEn: item.surahNameEn,
                surahNameId: item.surahNameId,
                surahNumber: item.surahNumber,
                translationTextEn: item.translationTextEn,
                translationTextId: item.translationTextId,
              ))
          .toList();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<PageRead>>> getQuranByPageText(
    int pageNumber,
  ) async {
    try {
      final dataList = await _localDataSource.getQuranByPageText(pageNumber);
      final data = dataList
          .map((item) => PageRead(
                id: item.id,
                ayahNumber: item.ayahNumber,
                ayahSearchText: item.ayahSearchText,
                ayahText: item.ayahText,
                footnotesEn: item.footnotesTextEn,
                footnotesId: item.footnotesTextId,
                juzNumber: item.juzNumber,
                surahDescendPlace: item.surahDescendText,
                surahNameAr: item.surahNameAr,
                surahNameEn: item.surahNameEn,
                surahNameId: item.surahNameId,
                surahNumber: item.surahNumber,
                translationTextEn: item.translationTextEn,
                translationTextId: item.translationTextId,
                pageNumber: item.pageNumber,
              ))
          .toList();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<SurahRead>>> getQuranBySurahText(
    int surahNumber,
  ) async {
    try {
      final dataList = await _localDataSource.getQuranBySurahText(surahNumber);
      final data = dataList
          .map((item) => SurahRead(
                id: item.id,
                ayahNumber: item.ayahNumber,
                ayahSearchText: item.ayahSearchText,
                ayahText: item.ayahText,
                footnotesEn: item.footnotesTextEn,
                footnotesId: item.footnotesTextId,
                surahDescendPlace: item.surahDescendText,
                surahNameAr: item.surahNameAr,
                surahNameEn: item.surahNameEn,
                surahNameId: item.surahNameId,
                surahNumber: item.surahNumber,
                translationTextEn: item.translationTextEn,
                translationTextId: item.translationTextId,
              ))
          .toList();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<AyahSearchResult>>> getQuranSearchResult(
    String query,
  ) async {
    try {
      final dataList = await _localDataSource.getQuranSearchResult(query);
      final data = dataList
          .map((item) => AyahSearchResult(
                ayahNumber: item.ayahNumber,
                ayahText: item.ayahText,
                id: item.id,
                surahName: item.surahNameEn,
                surahNumber: item.surahNumber,
                translationEn: item.translationTextEn,
                translationId: item.translationTextId,
              ))
          .toList();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<SurahIndex>>> getSurahIndex() async {
    try {
      final dataList = await _localDataSource.getSurahIndex();
      final data = dataList
          .map((item) => SurahIndex(
                id: item.id,
                ayahTotal: item.ayahTotal,
                surahDescendText: item.surahDescendText,
                surahNameAr: item.surahNameAr,
                surahNameEN: item.surahNameEN,
                surahNameID: item.surahNameID,
                surahNumber: item.surahNumber,
              ))
          .toList();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<SurahListing>>> getSurahList() async {
    try {
      final dataList = await _localDataSource.getSurahList();
      final data = dataList
          .map((item) => SurahListing(
                id: item.id,
                surahName: item.surahNameEn,
                surahNumber: item.surahNumber,
              ))
          .toList();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<SurahSearchResult>>> getSurahSearchResult(
    String query,
  ) async {
    try {
      final dataList = await _localDataSource.getSurahSearchResult(query);
      final data = dataList
          .map((item) => SurahSearchResult(
                id: item.id,
                ayahTotal: item.numberOfAyah,
                searchableSurahName: item.surahNameEmlaey,
                surahDescendPlace: item.turunSurah,
                surahNameAr: item.surahNameAr,
                surahNameEn: item.surahNameEn,
                surahNameId: item.surahNameId,
                surahNumber: item.surahNumber,
              ))
          .toList();
      return DataSuccess(data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return DataFailed(e.toString());
    }
  }
}
