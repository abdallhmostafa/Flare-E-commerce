import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare/common/helpers/firebase_exception.dart';
import 'package:flare/core/constants/app_firebase_constant.dart';
import 'package:flare/core/extentions/firebase_cache_extention.dart';
import 'package:flare/data/order/model/delivery_address_model.dart';
import 'package:flare/data/order/model/order_model_request.dart';
import 'package:flare/data/order/model/order_registration_req.dart';
import 'package:flare/data/order/source/order_firebase_service_repo.dart';
import 'package:flare/domain/order/entities/product_ordered_entity.dart';

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

  @override
  Future<Either<dynamic, List<Map<String, dynamic>>>> getCartProducts() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore
          .instance
          .collection(AppFirebaseConstant.userCollection)
          .doc(user!.uid)
          .collection(AppFirebaseConstant.cartCollection)
          .getCacheFirst();
      final List<Map<String, dynamic>> cartProducts = [];
      for (final doc in data.docs) {
        cartProducts.add(doc.data()..addAll({'id': doc.id}));
      }
      return Right(cartProducts);
    } on FirebaseException catch (e) {
      return Left(checkFirebaseException(e));
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<dynamic, String>> removeCartProducts(
      {required String id}) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection(AppFirebaseConstant.userCollection)
          .doc(user!.uid)
          .collection(AppFirebaseConstant.cartCollection)
          .doc(id)
          .delete();

      return const Right("Product Removed Successfully 😊");
    } on FirebaseException catch (e) {
      return Left(checkFirebaseException(e));
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> removeAllOrderedProduct(
      {required List<ProductOrderedEntity> orderedProducts}) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      for (final item in orderedProducts) {
        await FirebaseFirestore.instance
            .collection(AppFirebaseConstant.userCollection)
            .doc(user!.uid)
            .collection(AppFirebaseConstant.cartCollection)
            .doc(item.id)
            .delete();
      }

      return const Right("All Product Removed Successfully 😊");
    } on FirebaseException catch (e) {
      return Left(checkFirebaseException(e));
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> addDeliveryAddress(
      {required DeliveryAddressModel deliveryAddressModel}) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection(AppFirebaseConstant.userCollection)
          .doc(user!.uid)
          .collection(AppFirebaseConstant.deliveryAddressCollection)
          .add(deliveryAddressModel.toJson());
      return const Right('Deliver Address Added Successfully 😊');
    } on FirebaseException catch (e) {
      return Left(checkFirebaseException(e));
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> orderRegistration(
      {required OrderRegistrationReq orderedProducts}) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection(AppFirebaseConstant.userCollection)
          .doc(user!.uid)
          .collection(AppFirebaseConstant.ordersCollection)
          .add(orderedProducts.toMap());
      for (final item in orderedProducts.orderedProducts) {
        await FirebaseFirestore.instance
            .collection(AppFirebaseConstant.userCollection)
            .doc(user.uid)
            .collection(AppFirebaseConstant.cartCollection)
            .doc(item.id)
            .delete();
      }

      return const Right('Order Registered Successfully 😊');
    } on FirebaseException catch (e) {
      return Left(checkFirebaseException(e));
    } catch (e) {
      return Left(e);
    }
  }

  @override
   Future<Either<dynamic, List<Map<String, dynamic>>>> getOrderedProducts() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final ordereProducts = await FirebaseFirestore.instance
          .collection(AppFirebaseConstant.userCollection)
          .doc(user!.uid)
          .collection(AppFirebaseConstant.ordersCollection)
          .getCacheFirst();

      return Right(ordereProducts.docs.map((e) => e.data()).toList());
    } on FirebaseException catch (e) {
      return Left(checkFirebaseException(e));
    } catch (e) {
      return Left(e);
    }
  }
}
