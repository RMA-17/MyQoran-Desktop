import 'package:my_qoran/core/domain/model/listing/listing_model.dart';

class PageListing extends ListingEntity {
  final int? id;
  final int? pageNumber;

  PageListing({
    this.id,
    this.pageNumber,
  });

  @override
  List<Object?> get props => [id, pageNumber];
}
