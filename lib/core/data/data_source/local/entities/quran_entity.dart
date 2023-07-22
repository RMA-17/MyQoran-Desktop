import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "quran")
class QuranEntity extends Equatable {
  @PrimaryKey()
  final int? id;

  @ColumnInfo(name: "sora_number")
  final int? surahNumber;

  @ColumnInfo(name: "jozz")
  final int? juzNumber;

  @ColumnInfo(name: "page")
  final int? pageNumber;

  @ColumnInfo(name: "sora_name_en")
  final String? surahNameEn;

  @ColumnInfo(name: "sora_name_ar")
  final String? surahNameAr;

  @ColumnInfo(name: "aya_no")
  final int? ayahNumber;

  @ColumnInfo(name: "aya_text")
  final String? ayahText;

  @ColumnInfo(name: "aya_text_emlaey")
  final String? ayahSearchText;

  @ColumnInfo(name: "translation_id")
  final String? translationTextId;

  @ColumnInfo(name: "translation_en")
  final String? translationTextEn;

  @ColumnInfo(name: "footnotes_id")
  final String? footnotesTextId;

  @ColumnInfo(name: "sora_name_id")
  final String? surahNameId;

  @ColumnInfo(name: "sora_descend_place")
  final String? surahDescendText;

  @ColumnInfo(name: "sora_name_emlaey")
  final String? surahNameSearchText;

  @ColumnInfo(name: "footnotes_en")
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
