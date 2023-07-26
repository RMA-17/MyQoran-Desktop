import 'package:equatable/equatable.dart';

class PageView extends Equatable {
  final int? id;

  final int? pageNumber;

  final int? surahNumber;

  final int? ayahNumber;

  final String? surahNameEn;

  final String? surahNameAr;

  const PageView({
    this.ayahNumber,
    this.id,
    this.pageNumber,
    this.surahNameAr,
    this.surahNameEn,
    this.surahNumber,
  });

  @override
  List<Object?> get props =>
      [ayahNumber, id, pageNumber, surahNameAr, surahNameEn, surahNumber];
}
