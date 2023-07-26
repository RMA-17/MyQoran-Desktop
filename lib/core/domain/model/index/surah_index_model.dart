import 'package:my_qoran/core/domain/model/index/indexing_model.dart';

class SurahIndex extends IndexingEntity {
  final int? id;
  final int? ayahTotal;
  final String? surahNameAr;
  final String? surahNameEN;
  final String? surahNameID;
  final int? surahNumber;
  final String? surahDescendText;

  SurahIndex({
    this.id,
    this.ayahTotal,
    this.surahNameAr,
    this.surahNameEN,
    this.surahNameID,
    this.surahNumber,
    this.surahDescendText,
  });

  @override
  List<Object?> get props => [
        id,
        ayahTotal,
        surahNameAr,
        surahNameEN,
        surahNameID,
        surahNumber,
        surahDescendText,
      ];
}
