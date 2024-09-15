import 'package:flare/data/auth/repository/auth_repo_impl.dart';
import 'package:flare/data/auth/source/auth_firebase_service.dart';
import 'package:flare/data/auth/source/auth_firebase_service_impl.dart';
import 'package:flare/data/category/repository/category_repo_impl.dart';
import 'package:flare/data/category/source/category_firebase_service.dart';
import 'package:flare/data/category/source/category_firebase_service_impl.dart';
import 'package:flare/domain/auth/repository/auth_domain_repo.dart';
import 'package:flare/domain/auth/usecase/forget_password_use_case.dart';
import 'package:flare/domain/auth/usecase/get_ages_use_case.dart';
import 'package:flare/domain/auth/usecase/get_user_data_use_case.dart';
import 'package:flare/domain/auth/usecase/is_user_sign_in_use_case.dart';
import 'package:flare/domain/auth/usecase/sign_in_use_case.dart';
import 'package:flare/domain/auth/usecase/sign_up_use_case.dart';
import 'package:flare/domain/category/category_repository/category_domain_repo.dart';
import 'package:flare/domain/category/category_use_case/category_use_case.dart';
import 'package:get_it/get_it.dart';

class AppServiceLocator {
  static final AppServiceLocator _instance = AppServiceLocator._internal();
  AppServiceLocator._internal();
  factory AppServiceLocator() => _instance;

  static final getIt = GetIt.instance;
  static Future<void> initDependencies() async {
    // ---------------------- Services classes ---------------------- //
    getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
    getIt.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());

    // ---------------------- Repositories classes ---------------------- //
    getIt.registerSingleton<AuthRepo>(AuthRepoImpl());
    getIt.registerSingleton<CategoryDomainRepo>(CategoryRepoImpl());

    // ---------------------- Use cases classes ---------------------- //
    getIt.registerSingleton<SignUpUseCase>(SignUpUseCase());
    getIt.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
    getIt.registerSingleton<SignInUseCase>(SignInUseCase());
    getIt.registerSingleton<ForgetPasswordUseCase>(ForgetPasswordUseCase());
    getIt.registerSingleton<IsUserSignInUseCase>(IsUserSignInUseCase());
    getIt.registerSingleton<GetUserDataUseCase>(GetUserDataUseCase());
  
  
    getIt.registerSingleton<GeCategoryUseCase>(GeCategoryUseCase());


  }
}
