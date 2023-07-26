import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_qoran/core/domain/model/read/read_model.dart';

@immutable
abstract class ReadQuranState extends Equatable {
  final List<ReadEntity>? ayahList;
  final String? errorMessage;

  const ReadQuranState({this.ayahList, this.errorMessage});

  @override
  List<Object> get props => [ayahList!, errorMessage!];
}

class ReadQuranLoadingState extends ReadQuranState {
  const ReadQuranLoadingState();
}

class ReadQuranSuccessState extends ReadQuranState {
  const ReadQuranSuccessState(List<ReadEntity> ayahList)
      : super(ayahList: ayahList);
}

class ReadQuranFailedState extends ReadQuranState {
  const ReadQuranFailedState(String message) : super(errorMessage: message);
}
