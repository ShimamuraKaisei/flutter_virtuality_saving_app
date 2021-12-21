import 'package:flutter_virtuality_saving_app/domain/entity/category/category.dart';

class SqfCategory {
  static const keyId = "id";
  static const keyCategoryName = 'name';

  final String id;
  final String name;
  const SqfCategory({required this.id, required this.name});

  factory SqfCategory.fromMap(Map<String, dynamic> map) {
    return SqfCategory(
      id: map[keyId],
      name: map[keyCategoryName],
    );
  }

  Category toEntity() {
    return Category(
      id: id,
      name: name,
    );
  }

  static Map<String, dynamic> convertToMap(Category category) {
    return {
      keyId: category.id,
      keyCategoryName: category.name,
    };
  }
}
