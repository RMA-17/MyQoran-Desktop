import 'package:my_qoran/core/domain/model/listing/listing_model.dart';

class SurahListing extends ListingEntity {
  final int? id;
  final String? surahName;
  final int? surahNumber;

  SurahListing({
    this.id,
    this.surahName,
    this.surahNumber,
  });

  @override
  List<Object?> get props => [id, surahName, surahNumber];
}
