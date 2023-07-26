import 'package:equatable/equatable.dart';

class SurahView extends Equatable {
  final int? id;

  final int? surahNumber;

  final String? surahNameAr;

  final String? surahNameEN;

  final int? ayahTotal;

  final String? surahDescendText;

  final String? surahNameID;

  const SurahView({
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
