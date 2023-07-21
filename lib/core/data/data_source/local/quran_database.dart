import 'package:floor/floor.dart';
import 'package:my_qoran/core/data/data_source/local/entities/quran_entity.dart';
import 'package:my_qoran/core/data/data_source/local/quran_dao.dart';

@Database(version: 1, entities: [QuranEntity])
abstract final class QuranDatabase extends FloorDatabase {
  QuranDao get quranDao;
}
