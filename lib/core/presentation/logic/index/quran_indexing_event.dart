import 'package:flutter/foundation.dart';

@immutable
abstract class QuranIndexingEvent {
  const QuranIndexingEvent();
}

class GetIndexing extends QuranIndexingEvent {
  final IndexBy indexBy;
  const GetIndexing(this.indexBy);
}

enum IndexBy { bySurah, byJuz, byPage }
