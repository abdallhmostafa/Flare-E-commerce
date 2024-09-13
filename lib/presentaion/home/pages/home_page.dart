import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/presentaion/home/widgets/header_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppConstant.horizontalScreenPadding,
              vertical: AppConstant.verticalScreenPadding),
          child: Column(
            children: [
              HeaderSection(),
            ],
          ),
        ),
      ),
    );
  }
}
