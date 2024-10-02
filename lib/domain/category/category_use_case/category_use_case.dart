import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/domain/category/category_repository/category_domain_repo.dart';

class GeCategoryUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) {
    return AppServiceLocator.getIt<CategoryDomainRepo>().getCategories();
  }
}
