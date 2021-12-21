import 'package:flutter/rendering.dart';
import 'package:flutter_virtuality_saving_app/domain/entity/category/category.dart';
import 'package:flutter_virtuality_saving_app/domain/repository/i_category_repository.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/datasource/category_sqflite/i_category_sqflite.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/datasource/category_sqflite/model/sqf_category.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

//テーブルとデータベースは別のものを作成して使う
class CategorySqflite implements ICategorySqflite {
  static const _tableName = 'category';
  Future<Database> _getDatabase() async {
    final Future<Database> _database = openDatabase(
      join(await getDatabasesPath(), 'category_database.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE $_tableName(
            ${SqfCategory.keyId} TEXT,
            ${SqfCategory.keyCategoryName} TEXT,
          )
          ''',
        );
      },
      version: 1,
    );
    return _database;
  }

  @override
  Future<void> add(Category category) async {
    try {
      final Database db = await _getDatabase();
      final map = SqfCategory.convertToMap(category);
      await db.insert(_tableName, map);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      final Database db = await _getDatabase();
      await db.delete(
        _tableName,
        where: "${SqfCategory.keyId}=?",
        whereArgs: [id],
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SqfCategory>> getCategory() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(_tableName);
      return List.generate(
        maps.length,
        (i) => SqfCategory(
          id: maps[i]["id"],
          name: maps[i]["name"],
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> update(Category category) async {
    try {
      final Database db = await _getDatabase();
      final map = SqfCategory.convertToMap(category);
      await db.update(
        _tableName,
        map,
        where: "${SqfCategory.keyId}= ?",
        whereArgs: [category.id],
      );
    } catch (e) {
      rethrow;
    }
  }
}
