import 'package:bloc/bloc.dart';
import 'package:my_qoran/core/data/states/data_state.dart';
import 'package:my_qoran/core/domain/usecases/show_index_usecase.dart';
import 'package:my_qoran/core/presentation/logic/index/quran_indexing_event.dart';
import 'package:my_qoran/core/presentation/logic/index/quran_indexing_state.dart';

class QuranIndexingBloc extends Bloc<QuranIndexingEvent, QuranIndexingState> {
  QuranIndexingBloc({required IndexingUseCases useCase})
      : _useCases = useCase,
        super(const QuranIndexingLoading()) {
    on<GetIndexing>((_getIndexing));
  }

  final IndexingUseCases _useCases;

  Future<void> _getIndexing(
    GetIndexing event,
    Emitter<QuranIndexingState> emit,
  ) async {
    emit(const QuranIndexingLoading());
    switch (event.indexBy) {
      case IndexBy.bySurah:
        {
          final dataState = await _useCases.getSurahIndexing();

          if (dataState is DataFailed || dataState.error!.isNotEmpty) {
            emit(QuranIndexingFailed(dataState.error!));
            return;
          }

          emit(QuranIndexingSuccess(dataState.data!));
        }
        break;
      case IndexBy.byJuz:
        {
          final dataState = await _useCases.getJuzIndexing();

          if (dataState is DataFailed || dataState.error!.isNotEmpty) {
            emit(QuranIndexingFailed(dataState.error!));
            return;
          }

          emit(QuranIndexingSuccess(dataState.data!));
        }
        break;
      case IndexBy.byPage:
        {
          final dataState = await _useCases.getPageIndexing();

          if (dataState is DataFailed || dataState.error!.isNotEmpty) {
            emit(QuranIndexingFailed(dataState.error!));
            return;
          }

          emit(QuranIndexingSuccess(dataState.data!));
        }
        break;
    }
  }
}
