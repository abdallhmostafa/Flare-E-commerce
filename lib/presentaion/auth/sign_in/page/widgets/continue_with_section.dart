import 'package:flare/core/configs/assets/app_vectors_assets.dart';
import 'package:flare/presentaion/auth/sign_in/page/widgets/continue_with_item.dart';
import 'package:flutter/material.dart';

class ContinueWithSection extends StatelessWidget {
  const ContinueWithSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ContinueWithItem(
          assetName: AppVectorsAssets.bag,
          onTap: () {},
          text: "Continue With Apple",
        )
      ],
    );
  }
}
