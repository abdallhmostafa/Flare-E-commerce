import 'package:flare/app_service_locator.dart';
import 'package:flare/common/app_basic_reactive_button_cubit/app_basic_reactive_button_cubit.dart';
import 'package:flare/common/get_product_cubit/get_product_cubit.dart';
import 'package:flare/core/configs/route/custom_route_animation.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/data/auth/models/user_creation_request.dart';
import 'package:flare/data/auth/models/user_sign_in_request.dart';
import 'package:flare/data/order/model/product_ordered_model.dart';
import 'package:flare/domain/auth/entity/user_response_entity.dart';
import 'package:flare/domain/order/entities/ordered_products_entity.dart';
import 'package:flare/domain/order/entities/product_ordered_entity.dart';
import 'package:flare/domain/product/product_entity/product_entity.dart';
import 'package:flare/domain/product/use_cases/get_favorite_products_use_case.dart';
import 'package:flare/domain/product/use_cases/get_new_in_items_use_case.dart';
import 'package:flare/domain/product/use_cases/get_top_selling_items_use_case.dart';
import 'package:flare/presentation/delivery_address_page/logic/delivery_address_cubit.dart';
import 'package:flare/presentation/delivery_address_page/presentation/delivery_address_page.dart';
import 'package:flare/presentation/all_categories/presentation/all_categories_page.dart';
import 'package:flare/presentation/auth/forget_password/pages/email_sent_page.dart';
import 'package:flare/presentation/auth/forget_password/pages/forget_password_page.dart';
import 'package:flare/presentation/auth/gender_and_age_page/gender_and_age_page.dart';
import 'package:flare/presentation/auth/gender_and_age_page/logic/age_selection/ages_display_cubit.dart';
import 'package:flare/presentation/auth/gender_and_age_page/logic/age_selection_cubit.dart';
import 'package:flare/presentation/auth/gender_and_age_page/logic/gender_selection_cubit.dart';
import 'package:flare/presentation/auth/sign_in/logic/cubit/sing_in_cubit.dart';
import 'package:flare/presentation/auth/sign_in/page/enter_password_page.dart';
import 'package:flare/presentation/auth/sign_in/page/sign_in_page.dart';
import 'package:flare/presentation/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:flare/presentation/auth/sign_up/pages/sign_up_page.dart';
import 'package:flare/presentation/cart/logic/cubit/get_ordered_products_cart_cubit.dart';
import 'package:flare/presentation/cart/presentation/cart_page.dart';
import 'package:flare/presentation/checkout_page/presentation/checkout_page.dart';
import 'package:flare/presentation/favorites_page/presentation/favorites_page.dart';
import 'package:flare/presentation/home/logic/get_gategories_info_cubit/get_gategories_info_cubit.dart';
import 'package:flare/presentation/home/logic/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:flare/presentation/home/pages/home_page.dart';
import 'package:flare/presentation/nav_bar_page/presentation/nav_bar_page.dart';
import 'package:flare/presentation/notification_page/presentation/notification_page.dart';
import 'package:flare/presentation/order_placed_page/presentation/order_placed_page.dart';
import 'package:flare/presentation/ordered_details_page/presentation/ordered_details_page.dart';
import 'package:flare/presentation/ordered_items_page/presentation/ordered_items_page.dart';
import 'package:flare/presentation/orders_page/logic/cubit/get_ordered_products_cubit.dart';
import 'package:flare/presentation/orders_page/presentation/orders_page.dart';
import 'package:flare/presentation/product_detail_page/logic/favorite_icon_cubit.dart';
import 'package:flare/presentation/product_detail_page/logic/select_color_cubit.dart';
import 'package:flare/presentation/product_detail_page/logic/select_quantity_cubit.dart';
import 'package:flare/presentation/product_detail_page/logic/select_size_cubit.dart';
import 'package:flare/presentation/product_detail_page/presentation/product_detail_page.dart';
import 'package:flare/presentation/products_of_category/presentation/products_of_category_page.dart';
import 'package:flare/presentation/products_of_category/presentation/widgets/products_of_gateogry_model.dart';
import 'package:flare/presentation/search/presentation/search_page.dart';
import 'package:flare/presentation/profile_page/presentation/profile_page.dart';
import 'package:flare/presentation/splash/pages/splash_page.dart';
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
      case Routes.navBarPage:
        return CustomRouteAnimation(
          child:  const NavBarPage(),
        );
      case Routes.profilePage:
final UserResponseEntity 
        userDate = settings.arguments as UserResponseEntity;
        return CustomRouteAnimation(
          child:  ProfilePage(userDate: userDate),
        );
      case Routes.notificationPage:
        return CustomRouteAnimation(
          child: const NotificationPage(),
        );
      case Routes.orderedItemsPage:
        final List<ProductOrderedModel> orderedProducts;
        orderedProducts = settings.arguments as List<ProductOrderedModel>;
        return CustomRouteAnimation(
          child: OrderedItemsPage(orderedProducts: orderedProducts),
        );
      case Routes.orderedDetailsPage:
        final OrderedProductsEntity orderedProducts =
            settings.arguments as OrderedProductsEntity;
        return CustomRouteAnimation(
          child: OrderedDetailsPage(orderedProducts: orderedProducts),
        );
      case Routes.homePage:
        return CustomRouteAnimation(
          child: MultiBlocProvider(providers: [
            BlocProvider(
              create: (_) => GetProductCubit(
                  useCase: AppServiceLocator.getIt<GetTopSellingItemsUseCase>())
                ..getProducts(),
            ),
            BlocProvider(
              create: (_) => GetProductCubit(
                  useCase: AppServiceLocator.getIt<GetNewInItemsUseCase>())
                ..getProducts(),
            ),
            BlocProvider(
              create: (_) => GetGategoriesCubit()..getCategories(),
            ),
            BlocProvider(
              create: (_) => GetUserInfoCubit()..getUserInfo(),
            ),
          ], child: const HomePage()),
        );
      case Routes.allCategoriesPage:
        return CustomRouteAnimation(
          child: const AllCategoriesPage(),
        );
      case Routes.emailSentPage:
        return CustomRouteAnimation(
          child: const EmailSentPage(),
        );
      case Routes.deliveryAddressPage:
        return CustomRouteAnimation(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => AppBasicReactiveButtonCubit()),
              BlocProvider(
                  create: (_) =>
                      AppServiceLocator.getIt<DeliveryAddressCubit>()),
            ],
            child: const DeliveryAddressPage(),
          ),
        );
      case Routes.orderPlacedPage:
        return CustomRouteAnimation(
          child: const OrderPlacedPage(),
        );
     
      case Routes.favoritesPage:
        return CustomRouteAnimation(
          child: BlocProvider(
            create: (_) => GetProductCubit(
              useCase: AppServiceLocator.getIt<GetFavoriteProductsUseCase>(),
            )..getProducts(),
            child: const FavoritesPage(),
          ),
        );
      case Routes.ordersPage:
        return CustomRouteAnimation(
          child: BlocProvider(
            create: (_) => GetOrderedProductsCubit()..getOrderedProducts(),
            child: const OrdersPage(),
          ),
        );
      case Routes.checkoutPage:
        final List<ProductOrderedEntity> orderedProducts =
            settings.arguments as List<ProductOrderedEntity>;

        return CustomRouteAnimation(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => AppServiceLocator.getIt<DeliveryAddressCubit>(),
              ),
              BlocProvider(
                create: (context) => AppBasicReactiveButtonCubit(),
              ),
            ],
            child: CheckoutPage(orderedProducts: orderedProducts),
          ),
        );
      case Routes.cartPage:
        return CustomRouteAnimation(
          child: BlocProvider(
            create: (_) => GetOrderedProductsCartCubit()..getOrderedProducts(),
            child: const CartPage(),
          ),
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
              BlocProvider(
                  create: (_) => FavoriteIconCubit()
                    ..isFavorite(
                      productId: productEntity.productId,
                    )),
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
