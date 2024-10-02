import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/data/category/model/category_model.dart';
import 'package:flare/data/category/source/category_firebase_service.dart';
import 'package:flare/domain/category/category_entity/category_entity.dart';
import 'package:flare/domain/category/category_repository/category_domain_repo.dart';

class CategoryRepoImpl implements CategoryDomainRepo {
  @override
  Future<Either<dynamic, List<CategoryEntity>>> getCategories() async {
    final categories = await AppServiceLocator.getIt<CategoryFirebaseService>()
        .getCategories();
    return categories.fold(
      (failure) => left(failure),
      (category) => right(
        category.map((e) => CategoryModel.fromMap(e).toEntity()).toList(),
      ),
    );
  }
}
