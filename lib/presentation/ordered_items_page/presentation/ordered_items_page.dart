import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/data/order/model/product_ordered_model.dart';
import 'package:flare/presentation/cart/presentation/widgets/cart_with_items/cart_itme.dart';
import 'package:flutter/material.dart';

class OrderedItemsPage extends StatelessWidget {
  const OrderedItemsPage({super.key, required this.orderedProducts});
  final List<ProductOrderedModel> orderedProducts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: BasicAppBar(
          isCenterTitle: true,
          title:
              "${orderedProducts.length} ${orderedProducts.length == 1 ? "Item" : "Items"}",
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppConstant.horizontalScreenPadding,
        ),
        child: Column(
          children: [
            Space.verticalSpace(30),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => CartItme(
                  id: orderedProducts[index].id,
                  isThereRemoveButton: false,
                  image: orderedProducts[index].productImage,
                  title: orderedProducts[index].productTitle,
                  size: orderedProducts[index].productSize,
                  color: orderedProducts[index].productColor,
                  price: "\$${orderedProducts[index].productPrice}",
                ),
                separatorBuilder: (context, index) => Space.verticalSpace(8),
                itemCount: orderedProducts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
