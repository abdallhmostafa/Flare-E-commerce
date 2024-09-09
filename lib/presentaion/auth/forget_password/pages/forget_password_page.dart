import 'package:flare/common/app_basic_reactive_button_cubit/app_basic_reactive_button_cubit.dart';
import 'package:flare/common/app_basic_reactive_button_cubit/app_reactive_submit_bloc_listner.dart';
import 'package:flare/common/helpers/validation.dart';
import 'package:flare/common/widgets/button/app_basic_reactive_button.dart';
import 'package:flare/common/widgets/text_field/app_text_form_field.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/domain/auth/usecase/forget_password_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: BasicAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.defaultScreenPadding),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Space.verticalSpace(32),
                AppTextFormField(
                  hintText: 'Enter Email address',
                  textInputAction: TextInputAction.done,
                  validator: emailValidation,
                  controller: emailController,
                ),
                Space.verticalSpace(16),
                Row(
                  children: [
                    Expanded(
                      child: AppBasicReactiveButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AppBasicReactiveButtonCubit>().submit(
                                  useCase: ForgetPasswordUseCase(),
                                  params: emailController.text,
                                );
                          }
                        },
                        text: "Send",
                      ),
                    ),
                  ],
                ),
                AppReactiveSubmitBlocListner(
                  successMessage:
                      "Wohoo✨! Your password was sent successfully, please check your email",
                  forSuccessState: () {
                    context.pushNamedAndRemoveUntil(Routes.emailSentPage,
                        predicate: (route) => false);
                  },
                ),
                const Spacer(flex: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
