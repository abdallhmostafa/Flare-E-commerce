import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare/common/helpers/firebase_exception.dart';
import 'package:flare/core/constants/app_firebase_constant.dart';
import 'package:flare/core/extentions/firebase_cache_extention.dart';
import 'package:flare/data/product/model/product_model.dart';
import 'package:flare/data/product/source/product_firebase_service_repo.dart';
import 'package:flare/domain/product/product_entity/product_entity.dart';

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
          .getCacheFirst();
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
          .getCacheFirst();
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
          .getCacheFirst();
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
          .getCacheFirst();
      return right(response.docs.map((e) => e.data()).toList());
    } on FirebaseException catch (e) {
      return left(checkFirebaseException(e));
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either> removeOrAddFavoriteProduct(
      {required ProductEntity product}) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final products = await FirebaseFirestore.instance
          .collection(AppFirebaseConstant.userCollection)
          .doc(user!.uid)
          .collection(AppFirebaseConstant.favoriteProducts)
          .where(
            'productId',
            isEqualTo: product.productId,
          )
          .get();
      if (products.docs.isNotEmpty) {
        await products.docs.first.reference.delete();
        return right(false);
      } else {
        await FirebaseFirestore.instance
            .collection(AppFirebaseConstant.userCollection)
            .doc(user.uid)
            .collection(AppFirebaseConstant.favoriteProducts)
            .add(product.fromEntity().toJson());
        return right(true);
      }
    } on FirebaseException catch (e) {
      return left(checkFirebaseException(e));
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<bool> isFavoriteProduct({required String productId}) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final products = await FirebaseFirestore.instance
          .collection(AppFirebaseConstant.userCollection)
          .doc(user!.uid)
          .collection(AppFirebaseConstant.favoriteProducts)
          .where(
            'productId',
            isEqualTo: productId,
          )
          .get();
      if (products.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either<dynamic, List<Map<String, dynamic>>>>
      getFavoriteProducts() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final products = await FirebaseFirestore.instance
          .collection(AppFirebaseConstant.userCollection)
          .doc(user!.uid)
          .collection(AppFirebaseConstant.favoriteProducts)
          .get();

      return right(products.docs
          .map(
            (e) => e.data(),
          )
          .toList());
    } on FirebaseException catch (e) {
      return left(checkFirebaseException(e));
    } catch (e) {
      return left(e.toString());
    }
  }
}
