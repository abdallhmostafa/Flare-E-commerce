import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/domain/product/product_repository/product_domain_repository.dart';

class IsFavoriteProductUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) {
    return AppServiceLocator.getIt<ProductDomainRepository>()
        .isFavoriteProduct(productId: params!);
  }
}
