import 'package:dartz/dartz.dart';

abstract class CategoryDomainRepo {
  Future<Either> getCategories();
}