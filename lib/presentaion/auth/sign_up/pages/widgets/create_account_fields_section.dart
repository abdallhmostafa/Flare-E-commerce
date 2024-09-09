import 'package:flare/common/helpers/validation.dart';
import 'package:flare/common/widgets/text_field/app_text_form_field.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/presentaion/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountFieldsSection extends StatelessWidget {
  const CreateAccountFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<SignUpCubit>().formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextFormField(
              controller: context.read<SignUpCubit>().firstNameController,
              hintText: 'First name',
              textInputType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'First name is required';
                }
                return null;
              },
            ),
            Space.verticalSpace(16),
            AppTextFormField(
              controller: context.read<SignUpCubit>().lastNameController,
              hintText: 'Last name',
              textInputType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Last name is required';
                }
                return null;
              },
            ),
            Space.verticalSpace(16),
            AppTextFormField(
              controller: context.read<SignUpCubit>().emailController,
              hintText: 'Email address',
              textInputType: TextInputType.emailAddress,
              validator: emailValidation,
            ),
            Space.verticalSpace(16),
            AppTextFormField(
              controller: context.read<SignUpCubit>().passwordController,
              hintText: 'Password',
              isObscureText: true,
              textInputType: TextInputType.text,
              validator: passwordValidation,
            ),
            Space.verticalSpace(16),
            AppTextFormField(
              controller: context.read<SignUpCubit>().passwordConfirmController,
              hintText: 'Confirm password',
              isObscureText: true,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Confirm password is required';
                } else if (value !=
                    context.read<SignUpCubit>().passwordController.text) {
                  return 'Passwords do not match';
                }

                return null;
              },
            ),
          ],
        ));
  }
}
