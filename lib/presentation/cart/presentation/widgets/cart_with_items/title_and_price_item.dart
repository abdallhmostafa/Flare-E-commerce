import 'package:flutter/material.dart';

class TitleAndPriceItem extends StatelessWidget {
  const TitleAndPriceItem(
      {super.key, required this.title, required this.price});
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: const Color.fromRGBO(255, 255, 255, 0.5),
              ),
        ),
        const Spacer(),
        Text(
          price,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
