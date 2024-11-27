import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeLineItem extends StatelessWidget {
  const TimeLineItem(
      {super.key,
      required this.title,
      required this.date,
      this.isLastNode = false});
  final String title;
  final String date;
  final bool isLastNode;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 26.w,
              height: 26.h,
              decoration: BoxDecoration(
                color: isLastNode
                    ? const Color.fromRGBO(255, 255, 255, 0.5)
                    : AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: isLastNode
                  ? null
                  : Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 20.sp,
                    ),
            ),
            Space.horizotalSpace(12),
            Text(title,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: isLastNode
                          ? const Color.fromRGBO(255, 255, 255, 0.5)
                          : null,
                    )),
          ],
        ),
        Text(
          date,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: isLastNode
                    ? const Color.fromRGBO(255, 255, 255, 0.5)
                    : null,
              ),
        ),
      ],
    );
  }
}
