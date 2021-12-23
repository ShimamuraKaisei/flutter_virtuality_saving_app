import 'package:flutter_virtuality_saving_app/domain/entity/category/category.dart';
import 'package:flutter_virtuality_saving_app/domain/repository/i_category_repository.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/datasource/category_sqflite/i_category_sqflite.dart';

class CategoryRepositoryImple implements ICategoryRepository {
  final ICategorySqflite _sqf;
  CategoryRepositoryImple({
    required ICategorySqflite sqf,
  }) : _sqf = sqf;
  @override
  Future<void> add(Category category) async {
    try {
      await _sqf.add(category);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await _sqf.delete(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Category>> getCategory() async {
    try {
      final data = await _sqf.getCategory();
      return data.map((e) => e.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> update(Category category) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
