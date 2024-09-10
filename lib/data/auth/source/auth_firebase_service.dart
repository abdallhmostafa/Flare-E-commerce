import 'package:dartz/dartz.dart';
import 'package:flare/data/auth/models/user_creation_request.dart';
import 'package:flare/data/auth/models/user_sign_in_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationRequest user);
  Future<Either> getAges();
  Future<Either> signIn(UserSignInRequest userSignInRequest);
  Future<Either> sendPasswordResetEmail({required String email});
  Future<bool> isUserSignIn();

  // Future<Either> register(User user);
  // Future<Either> getCurrentUser();
  // Future<void> logout();
}
