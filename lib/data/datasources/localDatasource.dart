import 'dart:convert';
import 'dart:io';

import 'package:kairo/core/services/database_service.dart';
import 'package:kairo/data/models/trashModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class LocalDatasource {
  final DatabaseService databaseService;

  LocalDatasource({required this.databaseService});

  Future<String> _saveBase64ImageToFile(String base64Image) async {
    final bytes = base64Decode(base64Image);
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/uploads';

    await Directory(path).create(recursive: true);

    final file = File('$path/${const Uuid().v4()}.jpg');
    await file.writeAsBytes(bytes);

    return file.path;
  }

  // SIMPAN DATA KE SQLITE
  Future<TrashModel> savePrediction(TrashModel model) async {
    final db = await databaseService.database;

    final filePath = await _saveBase64ImageToFile(model.image);

    final dbModel = model.copyWith(
      image: filePath,
    );

    await db.insert(
      'predicted_trashes',
      dbModel.toDatabase(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return dbModel;
  }

  // AMBIL SEMUA DATA
  Future<List<TrashModel>> getAllPredictions() async {
    final db = await databaseService.database;

    final List<Map<String, dynamic>> maps =
        await db.query('predicted_trashes');

    if (maps.isEmpty) return [];

    return maps.map((e) => TrashModel.fromDatabase(e)).toList();
  }

  // DEBUG
  Future<void> printDatabase() async {
    final db = await databaseService.database;
    final data = await db.query('predicted_trashes');

    for (final row in data) {
      print(row);
    }
  }
}
