
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flare/common/helpers/firebase_exception.dart';
import 'package:flare/core/constants/app_firebase_constant.dart';
import 'package:flare/data/category/source/category_firebase_service.dart';

class CategoryFirebaseServiceImpl implements CategoryFirebaseService {
  @override
  Future<Either<dynamic, List<Map<String, dynamic>>>> getCategories() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> categories =
          await FirebaseFirestore.instance.collection(AppFirebaseConstant.categoriesCollection).get();

      return Right(categories.docs.map((e) => e.data()).toList());
    } on FirebaseException catch (e) {
      return Left(checkFirebaseException(e));
    } catch (e) {
      return Left(e);
    }
  }
}
