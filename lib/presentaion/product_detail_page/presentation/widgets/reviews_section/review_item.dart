import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.reviewImg});
  final String reviewImg;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(reviewImg),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Space.horizotalSpace(12),
                Text(
                  "John Doe",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            Row(
              children: List.generate(5, (index) {
                return index > 2
                    ? Icon(
                        Icons.star_outline_rounded,
                        color: AppColors.secondBackground,
                        size: 17.w,
                      )
                    : Icon(
                        Icons.star_rate_rounded,
                        color: AppColors.primary,
                        size: 17.w,
                      );
              }),
            )
          ],
        ),
        Space.verticalSpace(4),
        Text(
          "Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.",
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: const Color.fromRGBO(255, 255, 255, 0.5), fontSize: 12.sp),
        ),
        Space.verticalSpace(4),
        Text(
          "12 days ago",
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: AppColors.white, fontSize: 12.sp),
        ),
        Space.verticalSpace(12),
      ],
    );
  }
}
