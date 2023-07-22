import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@DatabaseView(
  "SELECT MIN(id) AS id, jozz, sora, aya_text, sora_name_ar, sora_name_en, aya_no FROM quran GROUP BY jozz ORDER BY id ASC",
  viewName: "juz",
)
class JuzView extends Equatable {
  @PrimaryKey()
  final int? id;

  @ColumnInfo(name: "jozz")
  final int? juzNumber;

  @ColumnInfo(name: "sora")
  final int? surahNumber;

  @ColumnInfo(name: "aya_text")
  final String? quranText;

  @ColumnInfo(name: "sora_name_en")
  final String? surahNameEn;

  @ColumnInfo(name: "sora_name_ar")
  final String? surahNameAr;

  @ColumnInfo(name: "aya_no")
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
