import 'package:dartz/dartz.dart';
import 'package:flare/domain/product/product_entity/product_entity.dart';

abstract class ProductDomainRepository {
  Future<Either> getTopSellingItems();
  Future<Either> getNewInItems();
  Future<bool> isFavoriteProduct({required String productId});
  Future<Either> getProductsByCategoryId({required String categoryId});
  Future<Either> getProductsByTitle({required String productTitle});
  Future<Either> removeOrAddFavoriteProduct({required ProductEntity product});
  Future<Either> getFavoriteProducts();
}
