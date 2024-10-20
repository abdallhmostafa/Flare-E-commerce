import 'package:flare/common/app_basic_reactive_button_cubit/app_basic_reactive_button_cubit.dart';
import 'package:flare/core/configs/route/custom_route_animation.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/data/auth/models/user_creation_request.dart';
import 'package:flare/data/auth/models/user_sign_in_request.dart';
import 'package:flare/domain/product/product_entity/product_entity.dart';
import 'package:flare/presentaion/all_categories/presentation/all_categories_page.dart';
import 'package:flare/presentaion/auth/forget_password/pages/email_sent_page.dart';
import 'package:flare/presentaion/auth/forget_password/pages/forget_password_page.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/gender_and_age_page.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/logic/age_selection/ages_display_cubit.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/logic/age_selection_cubit.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/logic/gender_selection_cubit.dart';
import 'package:flare/presentaion/auth/sign_in/logic/cubit/sing_in_cubit.dart';
import 'package:flare/presentaion/auth/sign_in/page/enter_password_page.dart';
import 'package:flare/presentaion/auth/sign_in/page/sign_in_page.dart';
import 'package:flare/presentaion/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:flare/presentaion/auth/sign_up/pages/sign_up_page.dart';
import 'package:flare/presentaion/cart/presentation/cart_page.dart';
import 'package:flare/presentaion/home/pages/home_page.dart';
import 'package:flare/presentaion/product_detail_page/logic/select_color_cubit.dart';
import 'package:flare/presentaion/product_detail_page/logic/select_quantity_cubit.dart';
import 'package:flare/presentaion/product_detail_page/logic/select_size_cubit.dart';
import 'package:flare/presentaion/product_detail_page/presentation/product_detail_page.dart';
import 'package:flare/presentaion/products_of_category/presentation/products_of_category_page.dart';
import 'package:flare/presentaion/products_of_category/presentation/widgets/products_of_gateogry_model.dart';
import 'package:flare/presentaion/search/presentation/search_page.dart';
import 'package:flare/presentaion/splash/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.splash:
        return CustomRouteAnimation(
          child: const SplashPage(),
        );
      case Routes.homePage:
        return CustomRouteAnimation(
          child: const HomePage(),
        );
      case Routes.allCategoriesPage:
        return CustomRouteAnimation(
          child: const AllCategoriesPage(),
        );
      case Routes.emailSentPage:
        return CustomRouteAnimation(
          child: const EmailSentPage(),
        );
      case Routes.cartPage:
        return CustomRouteAnimation(
          child: const CartPage(),
        );
      case Routes.searchPage:
        return CustomRouteAnimation(
          child: const SearchPage(),
        );
      case Routes.productDetailPage:
        ProductEntity productEntity = settings.arguments as ProductEntity;
        return CustomRouteAnimation(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => SelectQuantityCubit()),
              BlocProvider(create: (_) => SelectSizeCubit()),
              BlocProvider(create: (_) => SelectColorCubit()),
              BlocProvider(create: (_) => AppBasicReactiveButtonCubit()),
            ],
            child: ProductDetailPage(
              productEntity: productEntity,
            ),
          ),
        );
      case Routes.productsOfCategoryPage:
        final ProductsOfGateogryModel productsOfGateogryModel =
            settings.arguments as ProductsOfGateogryModel;
        return CustomRouteAnimation(
          child: ProductsOfCategoryPage(
              productsOfGateogryModel: productsOfGateogryModel),
        );
      case Routes.signInPage:
        return CustomRouteAnimation(
          child: BlocProvider(
            create: (_) => SingInCubit(),
            child: const SignInPage(),
          ),
        );
      case Routes.enterPasswordPage:
        final UserSignInRequest userSignInRequest =
            settings.arguments as UserSignInRequest;
        return CustomRouteAnimation(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => AppBasicReactiveButtonCubit()),
              BlocProvider(create: (_) => SingInCubit()),
            ],
            child: EnterPasswordPage(userSignInRequest: userSignInRequest),
          ),
        );
      case Routes.forgetPasswordPage:
        return CustomRouteAnimation(
          child: BlocProvider(
            create: (_) => AppBasicReactiveButtonCubit(),
            child: const ForgetPasswordPage(),
          ),
        );
      case Routes.signUpPage:
        return CustomRouteAnimation(
          child: BlocProvider(
            create: (_) => SignUpCubit(),
            child: const SignUpPage(),
          ),
        );
      case Routes.genderAndAgePage:
        final UserCreationRequest userCreationRequest =
            settings.arguments as UserCreationRequest;
        return CustomRouteAnimation(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => AgeSelectionCubit()),
              BlocProvider(create: (_) => GenderSelectionCubit()),
              BlocProvider(create: (_) => AgesDisplayCubit()),
              BlocProvider(create: (_) => AppBasicReactiveButtonCubit()),
            ],
            child: GenderAndAgePage(
              userCreationRequest: userCreationRequest,
            ),
          ),
        );
      default:
        return null;
    }
  }
}
