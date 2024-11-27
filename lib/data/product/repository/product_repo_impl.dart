import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/data/product/model/product_model.dart';
import 'package:flare/data/product/source/product_firebase_service_repo.dart';
import 'package:flare/domain/product/product_entity/product_entity.dart';
import 'package:flare/domain/product/product_repository/product_domain_repository.dart';

class ProductRepoImpl implements ProductDomainRepository {
  @override
  Future<Either> getTopSellingItems() async {
    final topSellingProducts =
        await AppServiceLocator.getIt<ProductFirebaseServiceRepo>()
            .getTopSellingItems();

    return topSellingProducts.fold(
      (failure) => left(failure),
      (prducts) => right(
        prducts
            .map(
              (product) => ProductModel.fromJson(product).toEntity(),
            )
            .toList(),
      ),
    );
  }

  @override
  Future<Either> getNewInItems() async {
    final newInItems =
        await AppServiceLocator.getIt<ProductFirebaseServiceRepo>()
            .getNewInItems();

    return newInItems.fold(
      (failure) => left(failure),
      (prducts) => right(
        prducts
            .map(
              (product) => ProductModel.fromJson(product).toEntity(),
            )
            .toList(),
      ),
    );
  }

  @override
  Future<Either> getProductsByCategoryId({required String categoryId}) async {
    final productsByCategoryId =
        await AppServiceLocator.getIt<ProductFirebaseServiceRepo>()
            .getProductsByCategoryId(categoryId: categoryId);

    return productsByCategoryId.fold(
      (failure) => left(failure),
      (prducts) => right(
        prducts
            .map(
              (product) => ProductModel.fromJson(product).toEntity(),
            )
            .toList(),
      ),
    );
  }

  @override
  Future<Either> getProductsByTitle({required String productTitle}) async {
    final productsByTitle =
        await AppServiceLocator.getIt<ProductFirebaseServiceRepo>()
            .getProductsByTitle(productTitle: productTitle);

    return productsByTitle.fold(
      (failure) => left(failure),
      (prducts) => right(
        prducts
            .map(
              (product) => ProductModel.fromJson(product).toEntity(),
            )
            .toList(),
      ),
    );
  }

  @override
  Future<Either> removeOrAddFavoriteProduct(
      {required ProductEntity product}) async {
    final isFavoriteProductOrNot =
        await AppServiceLocator.getIt<ProductFirebaseServiceRepo>()
            .removeOrAddFavoriteProduct(product: product);

    return isFavoriteProductOrNot.fold(
      (failure) => left(failure),
      (isFavoriteProductOrNot) => right(isFavoriteProductOrNot),
    );
  }

  @override
  Future<bool> isFavoriteProduct({required String productId}) async {
    return await AppServiceLocator.getIt<ProductFirebaseServiceRepo>()
        .isFavoriteProduct(productId: productId);
  }

  @override
  Future<Either> getFavoriteProducts() async {
    final response = await AppServiceLocator.getIt<ProductFirebaseServiceRepo>()
        .getFavoriteProducts();

    return response.fold(
      (failure) => left(failure),
      (favoriteProducts) =>
          right(favoriteProducts.map((favoriteProduct) => ProductModel.fromJson(favoriteProduct).toEntity(),).toList()),
    );
  }
}
