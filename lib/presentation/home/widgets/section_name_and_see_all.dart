import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionNameAndSeeAll extends StatelessWidget {
  const SectionNameAndSeeAll({
    super.key,
    required this.sectionName,
    required this.onTap, this.color,
  });
  final String sectionName;
  final VoidCallback onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionName,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: color
              ),
        ),
        InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Text(
              'See All',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        )
      ],
    );
  }
}
