import 'package:dartz/dartz.dart';

abstract class ProductFirebaseServiceRepo {
  Future<Either<dynamic, List<Map<String, dynamic>>>> getTopSellingItems();
  Future<Either<dynamic, List<Map<String, dynamic>>>> getNewInItems();
  Future<Either<dynamic, List<Map<String, dynamic>>>> getProductsByCategoryId(
      {required String categoryId});
}
