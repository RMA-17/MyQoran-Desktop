import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@DatabaseView(
  "SELECT id, sora, sora_name_ar, sora_name_en, sora_name_id, COUNT(id) as ayah_total, sora_descend_place FROM quran GROUP by sora",
  viewName: "surah",
)
class SurahView extends Equatable {
  @PrimaryKey()
  final int? id;

  @ColumnInfo(name: "sora")
  final int? surahNumber;

  @ColumnInfo(name: "sora_name_ar")
  final String? surahNameAr;

  @ColumnInfo(name: "sora_name_en")
  final String? surahNameEN;

  @ColumnInfo(name: "ayah_total")
  final int? ayahTotal;

  @ColumnInfo(name: "sora_descend_place")
  final String? surahDescendText;

  @ColumnInfo(name: "sora_name_id")
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
