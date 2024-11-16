import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryAddressCubit extends Cubit<bool> {
  DeliveryAddressCubit() : super(false);
  final formKey = GlobalKey<FormState>();
  final streetAddressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCode = TextEditingController();

  void emitSuccess() {
    emit(true);
  }
}
