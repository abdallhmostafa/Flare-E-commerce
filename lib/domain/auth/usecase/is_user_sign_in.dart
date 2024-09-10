import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/domain/auth/repository/auth_domain_repo.dart';

class IsUserSignIn implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return AppServiceLocator.getIt<AuthRepo>().isUserSignIn();
  }
}
