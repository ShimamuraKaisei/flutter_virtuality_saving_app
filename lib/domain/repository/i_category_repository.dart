import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/domain/entity/category/category.dart';

abstract class ICategoryRepository {
  Future<void> add(Category category);
  Future<void> delete(String id);
  Future<void> update(Category category);
  Future<List<Category>> getCategory();
}
