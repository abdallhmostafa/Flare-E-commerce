import 'package:flare/common/app_basic_reactive_button_cubit/app_basic_reactive_button_cubit.dart';
import 'package:flare/common/widgets/custom_error/app_snack_bar_error.dart';
import 'package:flare/common/widgets/custom_snak_bar_success/app_snack_bar_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppReactiveSubmitBlocListner extends StatelessWidget {
  const AppReactiveSubmitBlocListner(
      {super.key, this.successMessage, this.forSuccessState});
  final String? successMessage;
  final VoidCallback? forSuccessState;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBasicReactiveButtonCubit,
        AppBasicReactiveButtonState>(
      listener: (context, state) {
        if (state is AppBasicReactiveButtonFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            appSnackBarError(context: context, errorMessge: state.errorMessage),
          );
        } else if (state is AppBasicReactiveButtonSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            appSnackBarSuccess(
                context: context,
                message: successMessage ?? "Congratulations!"),
          );
          forSuccessState?.call();

        }
      },
      listenWhen: (previous, current) =>
          current is AppBasicReactiveButtonFailureState ||
          current is AppBasicReactiveButtonSuccessState,
      child: const SizedBox.shrink(),
    );
  }
}
