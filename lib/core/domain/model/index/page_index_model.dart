import 'package:my_qoran/core/domain/model/index/indexing_model.dart';

class PageIndex extends IndexingEntity {
  final int? id;
  final int? pageNumber;

  PageIndex({
    this.id,
    this.pageNumber,
  });

  @override
  List<Object?> get props => [id, pageNumber];
}
