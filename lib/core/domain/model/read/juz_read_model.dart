import 'package:my_qoran/core/domain/model/read/read_model.dart';

class JuzRead extends ReadEntity {
  final int? id;
  final int? surahNumber;
  final int? juzNumber;
  final int? ayahNumber;
  final String? ayahText;
  final String? ayahSearchText;
  final String? translationTextId;
  final String? translationTextEn;
  final String? surahNameId;
  final String? surahNameEn;
  final String? surahNameAr;
  final String? footnotesId;
  final String? footnotesEn;
  final String? surahDescendPlace;

  JuzRead({
    this.id,
    this.surahNumber,
    this.juzNumber,
    this.ayahNumber,
    this.ayahText,
    this.ayahSearchText,
    this.translationTextId,
    this.translationTextEn,
    this.surahNameId,
    this.surahNameEn,
    this.surahNameAr,
    this.footnotesId,
    this.footnotesEn,
    this.surahDescendPlace,
  });

  @override
  List<Object?> get props => [
        id,
        surahNumber,
        juzNumber,
        ayahNumber,
        ayahText,
        ayahSearchText,
        translationTextId,
        translationTextEn,
        surahNameId,
        surahNameEn,
        surahNameAr,
        footnotesId,
        footnotesEn,
        surahDescendPlace,
      ];
}
