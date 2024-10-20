import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare/common/helpers/firebase_exception.dart';
import 'package:flare/core/constants/app_firebase_constant.dart';
import 'package:flare/data/order/model/order_model_request.dart';
import 'package:flare/data/order/source/order_firebase_service_repo.dart';

class OrderFirebaseServiceImpl implements OrderFirebaseServiceRepo {
  @override
  Future<Either> addToCart(
      {required OrderModelRequest orderModelRequest}) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection(AppFirebaseConstant.userCollection)
          .doc(user!.uid)
          .collection(AppFirebaseConstant.cartCollection)
          .add(orderModelRequest.toJson());
      return const Right('Cart Added Successfully 😊');
    } on FirebaseException catch (e) {
      return Left(checkFirebaseException(e));
    } catch (e) {
      return Left(e);
    }
  }
}
