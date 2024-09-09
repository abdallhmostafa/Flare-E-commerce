import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/data/auth/models/user_creation_request.dart';
import 'package:flare/domain/auth/repository/auth_domain_repo.dart';

class SignUpUseCase implements UseCase<Either, UserCreationRequest> {
  @override
  Future<Either> call({UserCreationRequest? params})async {
    return AppServiceLocator.getIt<AuthRepo>().signup(params!);
  }
}
