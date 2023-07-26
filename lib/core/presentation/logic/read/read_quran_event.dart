import 'package:flutter/foundation.dart';

@immutable
abstract class ReadQuranEvent {
  const ReadQuranEvent();
}

class GetAyahToRead extends ReadQuranEvent {
  final int? juzNumber;
  final int? surahNumber;
  final int? pageNumber;
  final ReadType readType;
  const GetAyahToRead(this.readType,
      {this.juzNumber, this.surahNumber, this.pageNumber});
}

enum ReadType { bySurah, byJuz, byPage }
