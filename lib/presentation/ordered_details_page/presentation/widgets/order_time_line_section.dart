import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/presentation/ordered_details_page/presentation/widgets/time_line_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderTimeLineSection extends StatelessWidget {
  const OrderTimeLineSection({super.key, required this.date});
final String date;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          top: 26.h,
          left: 13.h,
          child: Container(
            width: 3.w,
            color: AppColors.primary,
          ),
        ),
        Column(
          children: [
             TimeLineItem(
              title: "Delivered",
              date: date,
              isLastNode: true,
            ),
            Space.verticalSpace(40),
             TimeLineItem(
              title: "Shipped",
              date: date,
            ),
            Space.verticalSpace(40),
             TimeLineItem(
              title: "Order Confirmed ",
              date: date,
            ),
            Space.verticalSpace(40),
             TimeLineItem(
              title: "Order Placed",
              date: date,
            ),
          ],
        ),
      ],
    );
  }
}
