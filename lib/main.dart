import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:small_project/core/feature/bloc/theme_bloc/theme_cubit.dart';
import 'package:small_project/feature/create_user/view/create_user.dart';
import 'package:small_project/injection_container.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return BlocBuilder<ThemeCubit, ThemeData>(
          bloc: sl<ThemeCubit>(),
          builder: (_, theme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: CreateUser(),
              theme: theme,
            );
          });
    });
  }
}
