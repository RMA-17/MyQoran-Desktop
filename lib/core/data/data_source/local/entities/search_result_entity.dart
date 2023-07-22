import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@DatabaseView(
  "SELECT sora, sora_name_ar, sora_name_en, sora_name_id, sora_name_emlaey, COUNT(id) as ayah_total, sora_descend_place FROM quran GROUP by sora",
  viewName: "search_surah_result",
)
class SearchSurahResultView extends Equatable {
  @PrimaryKey()
  final int? id;

  @ColumnInfo(name: "sora")
  final int? surahNumber;

  @ColumnInfo(name: "sora_name_ar")
  final String? surahNameAr;

  @ColumnInfo(name: "sora_name_en")
  final String? surahNameEn;

  @ColumnInfo(name: "ayah_total")
  final int? numberOfAyah;

  @ColumnInfo(name: "sora_name_emlaey")
  final String? surahNameEmlaey;

  @ColumnInfo(name: "sora_descend_place")
  final String? turunSurah;

  @ColumnInfo(name: "sora_name_id")
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
