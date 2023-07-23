class SurahSearchResult {
  final int? id;
  final int? surahNumber;
  final String? surahNameAr;
  final String? surahNameEn;
  final String? surahNameId;
  final int? ayahTotal;
  final String? searchableSurahName;
  final String? surahDescendPlace;

  const SurahSearchResult({
    this.id,
    this.ayahTotal,
    this.surahNameAr,
    this.surahNameEn,
    this.surahNumber,
    this.searchableSurahName,
    this.surahDescendPlace,
    this.surahNameId,
  });
}
