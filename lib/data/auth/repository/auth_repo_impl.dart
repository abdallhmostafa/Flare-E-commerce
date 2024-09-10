import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/data/auth/models/user_creation_request.dart';
import 'package:flare/data/auth/models/user_sign_in_request.dart';
import 'package:flare/data/auth/source/auth_firebase_service.dart';
import 'package:flare/domain/auth/repository/auth_domain_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either> signup(UserCreationRequest user) {
    return AppServiceLocator.getIt<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> getAges() {
    return AppServiceLocator.getIt<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signIn(UserSignInRequest userSignInRequest) {
    return AppServiceLocator.getIt<AuthFirebaseService>()
        .signIn(userSignInRequest);
  }

  @override
  Future<Either> sendPasswordResetEmail({required String email}) {
    return AppServiceLocator.getIt<AuthFirebaseService>()
        .sendPasswordResetEmail(email: email);
  }
  
  @override
  Future<bool> isUserSignIn() {
     return AppServiceLocator.getIt<AuthFirebaseService>().isUserSignIn();

  }
}
