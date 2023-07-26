import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_qoran/core/data/data_source/local/entities/juz_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/page_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/quran_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/search_result_entity.dart';
import 'package:my_qoran/core/data/data_source/local/entities/surah_entity.dart';
import 'dart:async';
part 'quran_dao.dart';

class QuranDatabase {
  static final QuranDatabase instance = QuranDatabase._init();

  static Database? _database;

  QuranDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('quran.db');
    return _database!;
  }

  Future<dynamic> _initDB(String filePath) async {
    final path = join(filePath, await getDatabasesPath());

    var isExists = await databaseExists(path);

    if (!isExists) {
      if (kDebugMode) {
        print('Creating from new assets');
      }

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      //Copy from asset
      ByteData data = await rootBundle.load(
        join("lib", "assets", "raw", "qoran.db"),
      );

      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      if (kDebugMode) {
        print("Opening Existing Database");
      }
    }

    return await openDatabase(
      filePath,
      readOnly: true,
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
