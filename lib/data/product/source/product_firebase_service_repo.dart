import 'package:dartz/dartz.dart';
import 'package:flare/domain/product/product_entity/product_entity.dart';

abstract class ProductFirebaseServiceRepo {
  Future<Either<dynamic, List<Map<String, dynamic>>>> getTopSellingItems();
  Future<Either<dynamic, List<Map<String, dynamic>>>> getNewInItems();
  Future<Either<dynamic, List<Map<String, dynamic>>>> getProductsByCategoryId(
      {required String categoryId});

  Future<Either<dynamic, List<Map<String, dynamic>>>> getProductsByTitle(
      {required String productTitle});
  Future<Either> removeOrAddFavoriteProduct({required ProductEntity product});
  Future<bool> isFavoriteProduct({required String productId});
   Future<Either<dynamic, List<Map<String, dynamic>>>> getFavoriteProducts();


}
