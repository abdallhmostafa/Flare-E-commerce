import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.emailAddress,
    this.isObscureText,
    this.validator,
     this.controller,
  });
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool? isObscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.displaySmall),
      textInputAction: textInputAction,
      keyboardType: textInputType,
      obscureText: isObscureText ?? false,
      validator: validator,
    );
  }
}
