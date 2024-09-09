import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/data/auth/models/user_sign_in_request.dart';
import 'package:flare/domain/auth/repository/auth_domain_repo.dart';

class SignInUseCase implements UseCase<Either, UserSignInRequest> {
  @override
  Future<Either> call({UserSignInRequest? params}) {
    return AppServiceLocator.getIt<AuthRepo>().signIn(params!);
  }
}
