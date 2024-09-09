part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class DisplaySplashState extends SplashState {}
final class AuthenticatedState extends SplashState {}
final class UnAuthenticatedState extends SplashState {}
