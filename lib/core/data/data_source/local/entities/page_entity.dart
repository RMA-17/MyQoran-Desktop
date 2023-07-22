import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@DatabaseView(
  "SELECT MIN(id) as id, page, sora, aya_no, sora_name_en, sora_name_ar FROM quran GROUP by page ORDER BY id",
  viewName: "page",
)
class PageView extends Equatable {
  @PrimaryKey()
  final int? id;

  @ColumnInfo(name: "page")
  final int? pageNumber;

  @ColumnInfo(name: "sora")
  final int? surahNumber;

  @ColumnInfo(name: "aya_no")
  final int? ayahNumber;

  @ColumnInfo(name: "sora_name_en")
  final String? surahNameEn;

  @ColumnInfo(name: "sora_name_ar")
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
