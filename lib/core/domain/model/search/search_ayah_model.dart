class AyahSearchResult {
  final int? id;
  final int? surahNumber;
  final int? ayahNumber;
  final String? translationId;
  final String? translationEn;
  final String? ayahText;
  final String? surahName;

  const AyahSearchResult({
    this.ayahNumber,
    this.ayahText,
    this.id,
    this.surahName,
    this.surahNumber,
    this.translationEn,
    this.translationId,
  });
}
