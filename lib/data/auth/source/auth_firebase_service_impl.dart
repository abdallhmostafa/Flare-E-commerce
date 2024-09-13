import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare/core/constants/app_firebase_constant.dart';
import 'package:flare/data/auth/models/user_creation_request.dart';
import 'package:flare/data/auth/models/user_sign_in_request.dart';
import 'package:flare/data/auth/source/auth_firebase_service.dart';

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signup(UserCreationRequest user) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      await FirebaseFirestore.instance
          .collection(AppFirebaseConstant.userCollection)
          .doc(userCredential.user!.uid)
          .set({
        'email': user.email,
        'firstName': user.firstName,
        'lastName': user.lastName,
        'gender': user.gender,
        'age': user.age,
        'uid': userCredential.user!.uid,
      });
      return const Right("Signup done Successfully 😊");
    } on FirebaseAuthException catch (error) {
      String errorMessage = "Something went wrong 😔";
      errorMessage = _checkFirebaseAuthException(error, errorMessage);

      return Left(errorMessage);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> ages = await FirebaseFirestore
          .instance
          .collection(AppFirebaseConstant.ageCollection)
          .get();
      List<String> ageList = [];
      for (var age in ages.docs) {
        ageList.add(age['value']);
      }
      return Right(ageList);
    } catch (error) {
      return const Left("please try again later 😔");
    }
  }

  @override
  Future<Either> signIn(UserSignInRequest userSignInRequest) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userSignInRequest.email!,
        password: userSignInRequest.password!,
      );

      return const Right("Sign In done Successfully 😊");
    } on FirebaseAuthException catch (error) {
      String errorMessage = "Something went wrong 😔";
      errorMessage = _checkFirebaseAuthException(error, errorMessage);

      return Left(errorMessage);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      return const Right("Password was sent to email 😊");
    } on FirebaseAuthException catch (error) {
      String errorMessage = "Something went wrong 😔";
      errorMessage = _checkFirebaseAuthException(error, errorMessage);

      return Left(errorMessage);
    }
  }

  @override
  Future<bool> isUserSignIn() async =>
      FirebaseAuth.instance.currentUser != null ? true : false;

  @override
  Future<Either<dynamic, Map<String, dynamic>?>> getUserData() async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      final userData = await FirebaseFirestore.instance
          .collection(AppFirebaseConstant.userCollection)
          .doc(currentUser?.uid)
          .get()
          .then((value) => value.data());
      return Right(userData);
    } on FirebaseException catch (e) {
      String errorMessage = '';
      errorMessage = _checkFirebaseException(e, errorMessage);
      return Left(errorMessage);
    } catch (e) {
      return const Left("Something went wrong 😔");
    }
  }
}

String _checkFirebaseException(FirebaseException error, String errorMessage) {
  if (error.code == 'permission-denied') {
    errorMessage = 'Permission denied';
  } else if (error.code == 'unavailable') {
    errorMessage = 'Service unavailable';
  } else if (error.code == 'aborted') {
    errorMessage = 'Aborted';
  } else if (error.code == 'cancelled') {
    errorMessage = 'Cancelled';
  } else if (error.code == 'data-loss') {
    errorMessage = 'Data loss';
  } else if (error.code == 'deadline-exceeded') {
    errorMessage = 'Deadline exceeded';
  } else if (error.code == 'internal') {
    errorMessage = 'Internal error';
  } else if (error.code == 'invalid-argument') {
    errorMessage = 'Invalid argument';
  } else if (error.code == 'not-found') {
    errorMessage = 'Not found';
  } else if (error.code == 'out-of-range') {
    errorMessage = 'Out of range';
  } else if (error.code == 'resource-exhausted') {
    errorMessage = 'Resource exhausted';
  } else if (error.code == 'unauthenticated') {
    errorMessage = 'Unauthenticated';
  } else if (error.code == 'unknown') {
    errorMessage = 'Unknown error';
  } else {
    errorMessage = 'Something went wrong 😔';
  }
  return errorMessage;
}

String _checkFirebaseAuthException(
    FirebaseAuthException error, String errorMessage) {
  if (error.code == 'user-not-found') {
    errorMessage = 'No user found for that email.';
  } else if (error.code == 'wrong-password') {
    errorMessage = 'Wrong password provided for that user.';
  } else if (error.code == 'invalid-email') {
    errorMessage = 'Invalid email provided.';
  } else if (error.code == 'user-disabled') {
    errorMessage = 'User disabled.';
  } else if (error.code == 'too-many-requests') {
    errorMessage = 'Too many requests. Try again later.';
  } else if (error.code == 'operation-not-allowed') {
    errorMessage = 'Operation not allowed.';
  } else if (error.code == 'network-request-failed') {
    errorMessage = 'Network request failed.';
  } else if (error.code == 'app-not-authorized') {
    errorMessage = 'App not authorized.';
  } else if (error.code == 'weak-password') {
    errorMessage = 'The password provided is too weak.';
  } else if (error.code == 'email-already-in-use') {
    errorMessage = 'The account already exists for that email.';
  } else if (error.code == 'invalid-email') {
    errorMessage = 'Invalid email provided.';
  } else if (error.code == 'operation-not-allowed') {
    errorMessage = 'Operation not allowed.';
  } else if (error.code == 'network-request-failed') {
    errorMessage = 'Network request failed.';
  } else if (error.code == 'app-not-authorized') {
    errorMessage = 'App not authorized.';
  } else if (error.code == 'invalid-api-key') {
    errorMessage = 'Invalid API key.';
  }
  return errorMessage;
}
