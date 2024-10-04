import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/button/app_basic_button.dart';
import 'package:flare/core/configs/assets/app_vectors_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductNotFounded extends StatelessWidget {
  const ProductNotFounded({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppVectorsAssets.notFound),
        Space.verticalSpace(24),
        Text(
          'Sorry, We couldn\'t find any matching result for your Search.',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
          softWrap: true,
          maxLines: 3,
        ),
        Space.verticalSpace(24),
        AppBasicButton(
          onPressed: () {},
          text: "Explore Categories",
        )
      ],
    );
  }
}
