import 'package:flare/app_service_locator.dart';
import 'package:flare/bloc_observer.dart';
import 'package:flare/flare_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await setup();
  runApp(const FlareApp());
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Bloc.observer = SimpleBlocObserver();
  Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    AppServiceLocator.initDependencies(),
  ]);
}
