import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/data/auth/models/user_sign_in_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingInCubit extends Cubit<bool> {
  SingInCubit() : super(false);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  void checkEmail(BuildContext context) {
    if (emailKey.currentState!.validate()) {
      emit(true);
      context.pushNamed(
        Routes.enterPasswordPage,
        argument: UserSignInRequest(
          email: emailController.text,
        ),
      );
    }
  }

  bool checkPassword({required UserSignInRequest userSignInRequest}) {
    if (passwordKey.currentState!.validate()) {
      emit(true);
      userSignInRequest.password = passwordController.text;
      return true;
    } else {
      return false;
    }
  }
}
