import 'package:equatable/equatable.dart';

class JuzView extends Equatable {
  final int? id;

  final int? juzNumber;

  final int? surahNumber;

  final String? quranText;

  final String? surahNameEn;

  final String? surahNameAr;

  final int? ayahNumber;

  const JuzView({
    this.ayahNumber,
    this.id,
    this.juzNumber,
    this.quranText,
    this.surahNameAr,
    this.surahNameEn,
    this.surahNumber,
  });

  @override
  List<Object?> get props => [
        ayahNumber,
        id,
        juzNumber,
        quranText,
        surahNameAr,
        surahNameEn,
        surahNumber,
      ];
}
