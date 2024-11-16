import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.isObscureText,
    this.validator,
    this.controller, this.inputFormatters,
  });
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool? isObscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.displaySmall,
      ),
      textInputAction: textInputAction,
      keyboardType: textInputType,
      obscureText: isObscureText ?? false,
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }
}
