import 'package:my_qoran/core/data/states/data_state.dart';
import 'package:my_qoran/core/domain/model/index/juz_index_model.dart';
import 'package:my_qoran/core/domain/model/index/page_index_model.dart';
import 'package:my_qoran/core/domain/model/index/surah_index_model.dart';
import 'package:my_qoran/core/domain/repository/qoran_repository.dart';

class IndexingUseCases {
  final QuranRepository _repository;
  const IndexingUseCases(this._repository);

  Future<DataState<List<SurahIndex>>> getSurahIndexing() =>
      _repository.getSurahIndex();

  Future<DataState<List<JuzIndex>>> getJuzIndexing() =>
      _repository.getJuzIndex();

  Future<DataState<List<PageIndex>>> getPageIndexing() =>
      _repository.getPageIndex();
}
