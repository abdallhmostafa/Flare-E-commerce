import 'package:flutter_bloc/flutter_bloc.dart';

class SelectColorCubit extends Cubit<String> {
  SelectColorCubit() : super('');
  String selectedColor='';
  void selectColor(String color) {
    selectedColor = color;
    emit(selectedColor);
  }
}