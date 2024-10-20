
import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/assets/app_images_assets.dart';
import 'package:flare/presentaion/product_detail_page/presentation/widgets/reviews_section/review_item.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews",
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Space.verticalSpace(12),
        Text("4.5 Ratings", style: Theme.of(context).textTheme.headlineMedium),
        Space.verticalSpace(12),
        Text(
          "213 Reviews",
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: const Color.fromRGBO(255, 255, 255, 0.5),
              ),
        ),
        Space.verticalSpace(16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            final List listOfImages = [
              AppImagesAssets.reviewImgOne,
              AppImagesAssets.reviewImgTwo,
            ];
            return ReviewItem(
                reviewImg:
                     listOfImages[index]);
          },
        ),
      ],
    );
  }
}
