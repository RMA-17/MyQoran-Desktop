import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class QuranEntity extends Equatable {
  @PrimaryKey(autoGenerate: true)
  int? id;

  @ColumnInfo(name: "sora_number")
  int? surahNumber;

  @ColumnInfo(name: "jozz")
  int? juzNumber;

  @ColumnInfo(name: "page")
  int? pageNumber;

  @ColumnInfo(name: "sora_name_en")
  String? surahNameEn;

  @ColumnInfo(name: "sora_name_ar")
  String? surahNameAr;

  @ColumnInfo(name: "aya_no")
  int? ayahNumber;

  @ColumnInfo(name: "aya_text")
  String? ayahText;

  @ColumnInfo(name: "aya_text_emlaey")
  String? ayahSearchText;

  @ColumnInfo(name: "translation_id")
  String? translationTextId;

  @ColumnInfo(name: "translation_en")
  String? translationTextEn;

  @ColumnInfo(name: "footnotes_id")
  String? footnotesTextId;

  @ColumnInfo(name: "sora_name_id")
  String? surahNameId;

  @ColumnInfo(name: "sora_descend_place")
  String? surahDescendText;

  @ColumnInfo(name: "sora_name_emlaey")
  String? surahNameSearchText;

  @ColumnInfo(name: "footnotes_en")
  String? footnotesTextEn;

  QuranEntity({
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
  List<Object?> get props {
    return [
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
}
