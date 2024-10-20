import 'package:flare/common/app_basic_reactive_button_cubit/app_reactive_submit_bloc_listner.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/common/widgets/favorite_icon_button/favorite_icon_button.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/domain/product/product_entity/product_entity.dart';
import 'package:flare/presentaion/product_detail_page/presentation/widgets/add_to_bag_button.dart';
import 'package:flare/presentaion/product_detail_page/presentation/widgets/product_images_section.dart';
import 'package:flare/presentaion/product_detail_page/presentation/widgets/product_info_section/product_info_section.dart';
import 'package:flare/presentaion/product_detail_page/presentation/widgets/reviews_section/reviews_section.dart';
import 'package:flare/presentaion/product_detail_page/presentation/widgets/select_color_section/select_color_section.dart';
import 'package:flare/presentaion/product_detail_page/presentation/widgets/select_quantity_section/select_quantity_section.dart';
import 'package:flare/presentaion/product_detail_page/presentation/widgets/select_size_section/select_size_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
    );
  }

  Container _body(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppConstant.horizontalScreenPadding),
      child: Stack(
        children: [
          _widgetsOfPage(),
          _addToBagButton(context),
        ],
      ),
    );
  }

  SingleChildScrollView _widgetsOfPage() {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          Space.verticalSpace(16),
          ProductImagesSection(productEntity: productEntity),
          Space.verticalSpace(32),
          SelectSizeSection(sizes: productEntity.sizes),
          Space.verticalSpace(16),
          SelectColorSection(colorEntity: productEntity.colors),
          Space.verticalSpace(16),
          const SelectQuantitySection(),
          Space.verticalSpace(24),
          const ProductInfoSection(),
          Space.verticalSpace(24),
          const ReviewsSection(),
          const AppReactiveSubmitBlocListner(successMessage:"Product added to bag successfully✨"),
          Space.verticalSpace(80),
        ],
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight + 10),
      child: BasicAppBar(
        actions: [
          FavoriteIconButton(paddingSize: 10.w, iconSize: 24.w),
        ],
      ),
    );
  }

  Positioned _addToBagButton(BuildContext context) {
    return Positioned(
      bottom: 10.h,
      left: 0,
      right: 0,
      child: AddToBagButton(productEntity: productEntity),
    );
  }
}
