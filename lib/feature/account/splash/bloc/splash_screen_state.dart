part of 'splash_screen_cubit.dart';

@immutable
abstract class SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}

class SplashScreenLoaded extends SplashScreenState {
  final ToWhereShouldINavigateAfterSplash toWhereShouldINavigateAfterSplash;

  SplashScreenLoaded(this.toWhereShouldINavigateAfterSplash);
}

class SplashScreenLoading extends SplashScreenState {}
