import 'package:get_it/get_it.dart';
import 'package:my_qoran/core/data/data_source/local/database/quran_database.dart';
import 'package:my_qoran/core/data/data_source/local/local_datasource.dart';
import 'package:my_qoran/core/data/repository/qoran_repository_impl.dart';
import 'package:my_qoran/core/domain/repository/qoran_repository.dart';
import 'package:my_qoran/core/domain/usecases/read_quran_usecase.dart';
import 'package:my_qoran/core/domain/usecases/search_ayah_usecase.dart';
import 'package:my_qoran/core/domain/usecases/search_surah_usecase.dart';
import 'package:my_qoran/core/domain/usecases/show_index_usecase.dart';
import 'package:my_qoran/core/presentation/logic/index/quran_indexing_bloc.dart';
import 'package:my_qoran/core/presentation/logic/read/read_quran_bloc.dart';

final inject = GetIt.instance;

Future<void> initialiseDependencies() async {
  /**
   * Singleton: Same instance for the app lifetime.
   * Factory: New Instance Everytime, Good for ViewModels.
   */

  final QuranDatabase quranDatabase = QuranDatabase.instance;

  //LocalDataSource:
  inject.registerSingleton<LocalDataSource>(LocalDataSource(quranDatabase));

  //Repository:
  inject.registerSingleton<QuranRepository>(QuranRepositoryImpl(inject()));

  //UseCase:
  inject.registerSingleton<ReadQuranUseCases>(ReadQuranUseCases(inject()));
  inject.registerSingleton<IndexingUseCases>(IndexingUseCases(inject()));
  inject.registerSingleton<SearchAyahUseCase>(SearchAyahUseCase(inject()));
  inject.registerSingleton<SearchSurahUseCase>(SearchSurahUseCase(inject()));

  //Logic
  inject.registerFactory<QuranIndexingBloc>(
    () => QuranIndexingBloc(
      useCase: inject(),
    ),
  );
  inject.registerFactory<ReadQuranBloc>(
    () => ReadQuranBloc(
      useCase: inject(),
    ),
  );
}
