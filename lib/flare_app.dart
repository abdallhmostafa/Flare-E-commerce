import 'package:flare/core/configs/route/app_routes.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/configs/theme/app_theme.dart';
import 'package:flare/presentaion/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlareApp extends StatelessWidget {
  const FlareApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    );
    return BlocProvider(
      create: (_) => SplashCubit()
        ..appStarted(), // TODO: Remove The cubit for the splash and use StateFulWidget
      child: MaterialApp(
        title: 'Flare App',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        initialRoute: Routes.splash,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
