import 'package:flare/common/app_basic_reactive_button_cubit/app_basic_reactive_button_cubit.dart';
import 'package:flare/core/configs/route/custom_route_animation.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/data/auth/models/user_creation_request.dart';
import 'package:flare/data/auth/models/user_sign_in_request.dart';
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
         case Routes.emailSentPage:
        return CustomRouteAnimation(
          child: const EmailSentPage(),
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
