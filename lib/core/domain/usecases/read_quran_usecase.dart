import 'package:my_qoran/core/data/states/data_state.dart';
import 'package:my_qoran/core/domain/model/read/juz_read_model.dart';
import 'package:my_qoran/core/domain/model/read/page_read_model.dart';
import 'package:my_qoran/core/domain/model/read/surah_read_model.dart';
import 'package:my_qoran/core/domain/repository/qoran_repository.dart';

class ReadQuranUseCases {
  final QuranRepository _repository;
  const ReadQuranUseCases(this._repository);

  Future<DataState<List<SurahRead>>> getReadBySurah(int surahNumber) =>
      _repository.getQuranBySurahText(surahNumber);

  Future<DataState<List<JuzRead>>> getReadByJuz(int juzNumber) =>
      _repository.getQuranByJuzText(juzNumber);

  Future<DataState<List<PageRead>>> getReadByPage(int pageNumber) =>
      _repository.getQuranByPageText(pageNumber);
}
