import 'package:equatable/equatable.dart';

class SearchSurahResultView extends Equatable {
  final int? id;

  final int? surahNumber;

  final String? surahNameAr;

  final String? surahNameEn;

  final int? numberOfAyah;

  final String? surahNameEmlaey;

  final String? turunSurah;

  final String? surahNameId;

  const SearchSurahResultView({
    this.id,
    this.numberOfAyah,
    this.surahNameAr,
    this.surahNameEmlaey,
    this.surahNameEn,
    this.surahNameId,
    this.surahNumber,
    this.turunSurah,
  });

  @override
  List<Object?> get props => [
        id,
        numberOfAyah,
        surahNameAr,
        surahNameEmlaey,
        surahNameEn,
        surahNameId,
        surahNumber,
        turunSurah,
      ];
}
