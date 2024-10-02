import 'package:dartz/dartz.dart';

abstract class CategoryFirebaseService {
  Future<Either<dynamic, List<Map<String, dynamic>>>> getCategories();
}
