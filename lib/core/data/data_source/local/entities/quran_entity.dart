import 'package:equatable/equatable.dart';

class QuranEntity extends Equatable {
  final int? id;

  final int? surahNumber;

  final int? juzNumber;

  final int? pageNumber;

  final String? surahNameEn;

  final String? surahNameAr;

  final int? ayahNumber;

  final String? ayahText;

  final String? ayahSearchText;

  final String? translationTextId;

  final String? translationTextEn;

  final String? footnotesTextId;

  final String? surahNameId;

  final String? surahDescendText;

  final String? surahNameSearchText;

  final String? footnotesTextEn;

  const QuranEntity({
    this.id,
    this.surahNumber,
    this.juzNumber,
    this.pageNumber,
    this.surahNameEn,
    this.surahNameAr,
    this.ayahNumber,
    this.ayahText,
    this.ayahSearchText,
    this.translationTextId,
    this.translationTextEn,
    this.footnotesTextId,
    this.surahNameId,
    this.surahDescendText,
    this.surahNameSearchText,
    this.footnotesTextEn,
  });

  @override
  List<Object?> get props => [
        id,
        surahNumber,
        juzNumber,
        pageNumber,
        surahNameEn,
        surahNameAr,
        ayahNumber,
        ayahText,
        ayahSearchText,
        translationTextId,
        translationTextEn,
        footnotesTextId,
        surahNameId,
        surahDescendText,
        surahNameSearchText,
        footnotesTextEn,
      ];
}
