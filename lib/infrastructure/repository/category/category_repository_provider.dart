import 'package:flutter_virtuality_saving_app/infrastructure/datasource/category_sqflite/category_sqflite.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/datasource/category_sqflite/i_category_sqflite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//ローカル用データソース
final categorySqfliteProvider = Provider<ICategorySqflite>((ref) => CategorySqflite());
