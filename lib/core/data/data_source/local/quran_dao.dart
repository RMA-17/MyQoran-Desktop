import 'package:floor/floor.dart';
import 'package:my_qoran/core/data/data_source/local/entities/quran_entity.dart';

@dao
abstract class QuranDao {
  @Query("SELECT * FROM quran")
  Future<List<QuranEntity>> getAllQuran();
}
