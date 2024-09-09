import 'package:flare/common/helpers/validation.dart';
import 'package:flare/common/widgets/text_field/app_text_form_field.dart';
import 'package:flare/presentaion/auth/sign_in/logic/cubit/sing_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordFieldSection extends StatelessWidget {
  const PasswordFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SingInCubit>().passwordKey,
      child: AppTextFormField(
        hintText: 'Enter password',
        controller: context.read<SingInCubit>().passwordController,
        isObscureText: true,
        textInputType: TextInputType.text,
        textInputAction: TextInputAction.done,
        validator: passwordValidation,
      ),
    );
  }
}
