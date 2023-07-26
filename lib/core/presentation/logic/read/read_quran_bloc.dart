import 'package:bloc/bloc.dart';
import 'package:my_qoran/core/data/states/data_state.dart';
import 'package:my_qoran/core/domain/usecases/read_quran_usecase.dart';
import 'package:my_qoran/core/presentation/logic/read/read_quran_event.dart';
import 'package:my_qoran/core/presentation/logic/read/read_quran_state.dart';

class ReadQuranBloc extends Bloc<ReadQuranEvent, ReadQuranState> {
  ReadQuranBloc({required ReadQuranUseCases useCase})
      : _useCases = useCase,
        super(const ReadQuranLoadingState()) {
    on<GetAyahToRead>((_getAyahToRead));
  }

  final ReadQuranUseCases _useCases;

  Future<void> _getAyahToRead(
    GetAyahToRead event,
    Emitter<ReadQuranState> emit,
  ) async {
    emit(const ReadQuranLoadingState());
    switch (event.readType) {
      case ReadType.byJuz:
        {
          final dataState = await _useCases.getReadByJuz(event.juzNumber!);
          if (dataState is DataFailed || dataState.data!.isEmpty) {
            emit(ReadQuranFailedState(dataState.error!));
            return;
          }
          emit(ReadQuranSuccessState(dataState.data!));
        }
        break;
      case ReadType.bySurah:
        {
          final dataState = await _useCases.getReadBySurah(event.surahNumber!);
          if (dataState is DataFailed || dataState.data!.isEmpty) {
            emit(ReadQuranFailedState(dataState.error!));
            return;
          }
          emit(ReadQuranSuccessState(dataState.data!));
        }
        break;
      case ReadType.byPage:
        {
          final dataState = await _useCases.getReadByPage(event.pageNumber!);
          if (dataState is DataFailed || dataState.data!.isEmpty) {
            emit(ReadQuranFailedState(dataState.error!));
            return;
          }
          emit(ReadQuranSuccessState(dataState.data!));
        }
        break;
    }
  }
}
