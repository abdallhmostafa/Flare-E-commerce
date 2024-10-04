import 'package:dartz/dartz.dart';

abstract class ProductDomainRepository {
  Future<Either> getTopSellingItems();
  Future<Either> getNewInItems();
  Future<Either> getProductsByCategoryId({required String categoryId});
  Future<Either> getProductsByTitle({required String productTitle});
}
