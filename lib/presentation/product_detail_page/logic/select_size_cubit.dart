import 'package:flutter_bloc/flutter_bloc.dart';

class SelectSizeCubit extends Cubit<String> {
  SelectSizeCubit() : super('');

  String selectedSize = '';
  void selectSize(String size) {
    selectedSize = size;
    emit(selectedSize);
  }

  //change the state of the cubit to the selected size
}
