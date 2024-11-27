import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/button/app_basic_button.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flutter/material.dart';

class NoFavoriteProducts extends StatelessWidget {
  const NoFavoriteProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'There are No\nFavorite Products\nyet',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
          softWrap: true,
          maxLines: 3,
        ),
        Space.verticalSpace(24),
        AppBasicButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.homePage);
          },
          text: "Explore Categories",
        )
      ],
    );
  }
}
