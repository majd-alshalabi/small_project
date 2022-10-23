import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:small_project/core/constants/constants.dart';
import 'package:small_project/core/constants/theme.dart';
import 'package:small_project/core/feature/bloc/theme_bloc/theme_cubit.dart';
import 'package:small_project/feature/account/login/view/login_screen.dart';
import 'package:small_project/feature/account/splash/bloc/splash_screen_cubit.dart';
import 'package:small_project/feature/home/view/home_screen.dart';
import 'package:small_project/injection_container.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = sl<ThemeCubit>().globalAppTheme;
    sl<SplashScreenCubit>().initState();

    return MultiBlocListener(
      listeners: [
        BlocListener(
          listener: (context, state) {
            if (state is SplashScreenLoaded) {
              if (state.toWhereShouldINavigateAfterSplash ==
                  ToWhereShouldINavigateAfterSplash.toHome) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              }
            }
          },
          bloc: sl<SplashScreenCubit>(),
        )
      ],
      child: Scaffold(
        body: Center(
            child: Icon(
          Icons.imagesearch_roller_rounded,
          size: 18.w,
          color: theme.primeColor,
        )),
      ),
    );
  }
}
