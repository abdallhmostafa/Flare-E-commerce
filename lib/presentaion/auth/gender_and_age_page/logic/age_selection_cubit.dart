import 'package:flutter_bloc/flutter_bloc.dart';

class AgeSelectionCubit extends Cubit<String> {
  AgeSelectionCubit() : super('Select Age Range');

  String selectAge = '';
  void selectAgeRange(String ageRange) {
    selectAge = ageRange;
    emit(selectAge);
  }
}
