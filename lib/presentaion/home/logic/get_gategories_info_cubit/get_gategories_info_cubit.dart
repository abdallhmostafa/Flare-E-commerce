import 'package:flare/app_service_locator.dart';
import 'package:flare/domain/category/category_entity/category_entity.dart';
import 'package:flare/domain/category/category_use_case/category_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'get_gategories_info_state.dart';

class GetGategoriesCubit extends Cubit<GetGategoriesState> {
  GetGategoriesCubit() : super(GetGategoriesLoadingState());
  int getlength() {
    {
      if (state is GetGategoriesSuccessState) {
        return (state as GetGategoriesSuccessState).categories.length;
      } else if (state is GetGategoriesFailureState) {
        return 0;
      } else {
        return 7;
      }
    }
  }

  Future<void> getCategories() async {
    final response =
        await AppServiceLocator.getIt.get<GeCategoryUseCase>().call();
    response.fold(
      (failure) => emit(
        GetGategoriesFailureState(
          failureMessage: failure.toString(),
        ),
      ),
      (data) => emit(
        GetGategoriesSuccessState(categories: data),
      ),
    );
  }
}
