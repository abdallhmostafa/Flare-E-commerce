import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/domain/auth/repository/auth_domain_repo.dart';

class ForgetPasswordUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) {
    return AppServiceLocator.getIt<AuthRepo>()
        .sendPasswordResetEmail(email: params!);
  }
}
