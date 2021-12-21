import 'package:flutter_virtuality_saving_app/domain/entity/category/category.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/datasource/category_sqflite/model/sqf_category.dart';

//インターフェース部分
abstract class ICategorySqflite {
  Future<void> add(Category category);
  Future<void> delete(String id);
  Future<void> update(Category category);
  Future<List<SqfCategory>> getCategory();
}
