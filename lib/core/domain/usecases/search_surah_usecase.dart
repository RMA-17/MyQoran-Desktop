import 'package:my_qoran/core/data/states/data_state.dart';
import 'package:my_qoran/core/domain/model/search/search_surah_model.dart';
import 'package:my_qoran/core/domain/repository/qoran_repository.dart';

class SearchSurahUseCase {
  final QuranRepository _repository;
  const SearchSurahUseCase(this._repository);

  Future<DataState<List<SurahSearchResult>>> call(String query) =>
      _repository.getSurahSearchResult(query);
}
