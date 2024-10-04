import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchFieldSection extends StatelessWidget {
  const SearchFieldSection({super.key, this.enabled, this.onChanged});
  final bool? enabled;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      textInputAction: TextInputAction.search,
      dragStartBehavior: DragStartBehavior.down,
      style: Theme.of(context).textTheme.labelMedium,
      onChanged: onChanged ,
      onSubmitted: onChanged,
      decoration: InputDecoration(
        hintText: 'Search',
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        prefixIcon: Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 20.w,
        ),
        border: _outlineInputBorder(),
        filled: true,
        enabledBorder: _outlineInputBorder(),
        focusedBorder: _outlineInputBorder(AppColors.primary),
        errorBorder: _outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(
        color: color ?? Colors.transparent,
      ),
    );
  }
}
