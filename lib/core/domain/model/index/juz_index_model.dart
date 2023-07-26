import 'package:my_qoran/core/domain/model/index/indexing_model.dart';

class JuzIndex extends IndexingEntity {
  final int? ayahNumber;
  final int? id;
  final int? juzNumber;

  JuzIndex({
    this.ayahNumber,
    this.id,
    this.juzNumber,
  });

  @override
  List<Object?> get props => [id, ayahNumber, juzNumber];
}
