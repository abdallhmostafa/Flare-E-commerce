import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/assets/app_vectors_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: SvgPicture.asset(
              AppVectorsAssets.notificationBell,
              width: 100.w,
              height: 100.h,
            ),
          ),
          Space.verticalSpace(27),
          Text(
            'No\nNotification yet',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Space.verticalSpace(30),
        ],
      ),
    );
  }
}
