import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_qoran/core/domain/model/index/indexing_model.dart';

@immutable
abstract class QuranIndexingState extends Equatable {
  final List<IndexingEntity>? dataList;
  final String? errorMessage;

  const QuranIndexingState({this.dataList, this.errorMessage});

  @override
  List<Object> get props => [dataList!, errorMessage!];
}

class QuranIndexingLoading extends QuranIndexingState {
  const QuranIndexingLoading();
}

class QuranIndexingSuccess extends QuranIndexingState {
  const QuranIndexingSuccess(List<IndexingEntity> dataList)
      : super(dataList: dataList);
}

class QuranIndexingFailed extends QuranIndexingState {
  const QuranIndexingFailed(String message) : super(errorMessage: message);
}
