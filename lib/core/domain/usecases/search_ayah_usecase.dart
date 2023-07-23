import 'package:my_qoran/core/data/states/data_state.dart';
import 'package:my_qoran/core/domain/model/search/search_ayah_model.dart';
import 'package:my_qoran/core/domain/repository/qoran_repository.dart';

class SearchAyahUseCase {
  final QuranRepository _repository;
  const SearchAyahUseCase(this._repository);

  Future<DataState<List<AyahSearchResult>>> call(String query) =>
      _repository.getAyahSearchResult(query);
}
