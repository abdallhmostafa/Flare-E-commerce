import 'package:flare/common/app_basic_reactive_button_cubit/app_basic_reactive_button_cubit.dart';
import 'package:flare/common/widgets/custom_loading/app_custom_loading.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBasicReactiveButton extends StatelessWidget {
  const AppBasicReactiveButton({
    super.key,
    this.text,
    required this.onPressed,
    this.haveChild = false,
    this.child,
  });
  final String? text;
  final VoidCallback onPressed;
  final bool haveChild;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBasicReactiveButtonCubit,
        AppBasicReactiveButtonState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: 16, horizontal: 24),
          ),
          child: state is AppBasicReactiveButtonLoadingState
              ? const Center(
                  child: AppCustomLoading(
                    height: 20,
                    width: 30,
                  ),
                )
              : haveChild
                  ? child
                  : Text(
                      text ?? "Continue",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppColors.white),
                    ),
        );
      },
    );
  }
}
