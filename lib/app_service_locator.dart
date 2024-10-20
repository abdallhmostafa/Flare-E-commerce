import 'package:flare/data/auth/repository/auth_repo_impl.dart';
import 'package:flare/data/auth/source/auth_firebase_service.dart';
import 'package:flare/data/auth/source/auth_firebase_service_impl.dart';
import 'package:flare/data/category/repository/category_repo_impl.dart';
import 'package:flare/data/category/source/category_firebase_service.dart';
import 'package:flare/data/category/source/category_firebase_service_impl.dart';
import 'package:flare/data/order/repository/order_repo_impl.dart';
import 'package:flare/data/order/source/order_firebase_service_impl.dart';
import 'package:flare/data/order/source/order_firebase_service_repo.dart';
import 'package:flare/data/product/repository/product_repo_impl.dart';
import 'package:flare/data/product/source/product_firebase_service_impl.dart';
import 'package:flare/data/product/source/product_firebase_service_repo.dart';
import 'package:flare/domain/auth/repository/auth_domain_repo.dart';
import 'package:flare/domain/auth/usecase/forget_password_use_case.dart';
import 'package:flare/domain/auth/usecase/get_ages_use_case.dart';
import 'package:flare/domain/auth/usecase/get_user_data_use_case.dart';
import 'package:flare/domain/auth/usecase/is_user_sign_in_use_case.dart';
import 'package:flare/domain/auth/usecase/sign_in_use_case.dart';
import 'package:flare/domain/auth/usecase/sign_up_use_case.dart';
import 'package:flare/domain/category/category_repository/category_domain_repo.dart';
import 'package:flare/domain/category/category_use_case/category_use_case.dart';
import 'package:flare/domain/order/order_domain_repository.dart';
import 'package:flare/domain/order/order_use_case.dart';
import 'package:flare/domain/product/use_cases/get_new_in_items_use_case.dart';
import 'package:flare/domain/product/product_repository/product_domain_repository.dart';
import 'package:flare/domain/product/use_cases/get_products_by_category_id.dart';
import 'package:flare/domain/product/use_cases/get_products_by_title_use_case.dart';
import 'package:flare/domain/product/use_cases/get_top_selling_items_use_case.dart';
import 'package:get_it/get_it.dart';

class AppServiceLocator {
  static final AppServiceLocator _instance = AppServiceLocator._internal();
  AppServiceLocator._internal();
  factory AppServiceLocator() => _instance;

  static final getIt = GetIt.instance;
  static Future<void> initDependencies() async {
    // ---------------------- Services classes ---------------------- //
    getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
    getIt.registerSingleton<CategoryFirebaseService>(
        CategoryFirebaseServiceImpl());
    getIt.registerSingleton<ProductFirebaseServiceRepo>(
        ProductFirebaseServiceImpl());
    getIt.registerSingleton<OrderFirebaseServiceRepo>(
        OrderFirebaseServiceImpl());

    // ---------------------- Repositories classes ---------------------- //
    getIt.registerSingleton<AuthRepo>(AuthRepoImpl());
    getIt.registerSingleton<CategoryDomainRepo>(CategoryRepoImpl());
    getIt.registerSingleton<ProductDomainRepository>(ProductRepoImpl());
    getIt.registerSingleton<OrderDomainRepository>(OrderRepoImpl());

    // ---------------------- Use cases classes ---------------------- //

    // -------------- auth -------------- //
    getIt.registerSingleton<SignUpUseCase>(SignUpUseCase());
    getIt.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
    getIt.registerSingleton<SignInUseCase>(SignInUseCase());
    getIt.registerSingleton<ForgetPasswordUseCase>(ForgetPasswordUseCase());
    getIt.registerSingleton<IsUserSignInUseCase>(IsUserSignInUseCase());

    // -------------- Home  -------------- //
    getIt.registerSingleton<GetUserDataUseCase>(GetUserDataUseCase());
    getIt.registerSingleton<GeCategoryUseCase>(GeCategoryUseCase());
    getIt.registerSingleton<GetTopSellingItemsUseCase>(
        GetTopSellingItemsUseCase());
    getIt.registerSingleton<GetNewInItemsUseCase>(GetNewInItemsUseCase());
    getIt.registerSingleton<GetProductsByTitleUseCase>(
        GetProductsByTitleUseCase());
    getIt.registerSingleton<GetProductsByCategoryIdUseCase>(
        GetProductsByCategoryIdUseCase());

    // -------------- Order  -------------- //
    getIt.registerSingleton<AddOrderUseCase>(AddOrderUseCase());
  }
}
