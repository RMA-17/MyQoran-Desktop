import 'package:my_qoran/core/domain/model/listing/listing_model.dart';

class JuzListing extends ListingEntity {
  final int? id;
  final int? juzNumber;

  JuzListing({
    this.id,
    this.juzNumber,
  });

  @override
  List<Object?> get props => [id, juzNumber];
}
