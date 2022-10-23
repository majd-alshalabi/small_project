import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_project/core/constants/constants.dart';
import 'package:small_project/core/storage/db_model/identity_model.dart';
import 'package:small_project/core/storage/identity_helper.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial());
  IdentityHelper db = IdentityHelper();
  initState() async {
    emit(SplashScreenLoading());
    List<MyIdentity> temp = await db.getMyIdentity();
    await Future.delayed(const Duration(seconds: 1));
    if (temp.isNotEmpty) {
      emit(SplashScreenLoaded(ToWhereShouldINavigateAfterSplash.toHome));
    } else {
      emit(SplashScreenLoaded(ToWhereShouldINavigateAfterSplash.toLogin));
    }
  }
}
