import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flare/common/helpers/firebase_exception.dart';
import 'package:flare/core/constants/app_firebase_constant.dart';
import 'package:flare/data/product/source/product_firebase_service_repo.dart';

class ProductFirebaseServiceImpl implements ProductFirebaseServiceRepo {
  @override
  Future<Either<dynamic, List<Map<String, dynamic>>>>
      getTopSellingItems() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection(AppFirebaseConstant.products)
          .where(
            'salesNumber',
            isGreaterThanOrEqualTo: 20,
          )
          .get();
      return right(response.docs.map((e) => e.data()).toList());
    } on FirebaseException catch (e) {
      return left(checkFirebaseException(e));
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<dynamic, List<Map<String, dynamic>>>> getNewInItems() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection(AppFirebaseConstant.products)
          .where(
            'createdDate',
            isGreaterThanOrEqualTo: Timestamp.fromDate(
              DateTime(2024, 9, 10),
            ),
          )
          .get();
      return right(response.docs.map((e) => e.data()).toList());
    } on FirebaseException catch (e) {
      return left(checkFirebaseException(e));
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<dynamic, List<Map<String, dynamic>>>> getProductsByCategoryId(
      {required String categoryId}) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection(AppFirebaseConstant.products)
          .where(
            'categoryId',
            isEqualTo: categoryId,
          )
          .get();
      return right(response.docs.map((e) => e.data()).toList());
    } on FirebaseException catch (e) {
      return left(checkFirebaseException(e));
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<dynamic, List<Map<String, dynamic>>>> getProductsByTitle(
      {required String productTitle}) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection(AppFirebaseConstant.products)
          .where(
            'title',
            isGreaterThanOrEqualTo: productTitle,
          )
          .get();
      return right(response.docs.map((e) => e.data()).toList());
    } on FirebaseException catch (e) {
      return left(checkFirebaseException(e));
    } catch (e) {
      return left(e.toString());
    }
  }
}
