import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/domain/auth/repository/auth_domain_repo.dart';

class GetUserDataUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await AppServiceLocator.getIt<AuthRepo>().getUserData();
  }
}
