import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:small_project/core/constants/constants.dart';
import 'package:small_project/core/constants/font_constants.dart';
import 'package:small_project/core/constants/theme.dart';
import 'package:small_project/core/feature/bloc/theme_bloc/theme_cubit.dart';
import 'package:small_project/core/widget/button.dart';
import 'package:small_project/core/widget/custom_text_field.dart';
import 'package:small_project/core/widget/space.dart';
import 'package:small_project/core/widget/text_field_with_country_picker.dart';
import 'package:small_project/core/widget/ui_text.dart';
import 'package:small_project/feature/home/view/home_screen.dart';
import 'package:small_project/injection_container.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppTheme theme = sl<ThemeCubit>().globalAppTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: UiText(
          'Register',
          style: TextStyles.montserrat.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        constraints: BoxConstraints(minHeight: 100.h, minWidth: 100.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: UiText(
                      'Phone Number',
                      style: TextStyles.montserrat.copyWith(
                          fontWeight: FontWeight.w500, fontSize: 12.sp),
                    ),
                  ),
                  TextFieldWithCountryCodePicker(
                    focusNode: focusNode,
                    controller: nameController,
                    onChange: (v) {
                      focusNode.requestFocus();
                      // phoneNumber = v;
                    },
                  )
                ],
              ),
              VSpace(Insets.m),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: UiText(
                      'Password',
                      style: TextStyles.montserrat.copyWith(
                          fontWeight: FontWeight.w500, fontSize: 12.sp),
                    ),
                  ),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Enter Password',
                    validator: (value) {
                      if ((value ?? "").length >= 3) {
                        return null;
                      }
                      return "password must be longer than 3";
                    },
                  ),
                ],
              ),
              VSpace(Insets.m),
              BasicButton(
                title: 'Login',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  }
                },
                titleTextStyle: TextStyles.profileTitleTextStyle
                    .copyWith(color: theme.accentTxt, fontSize: 12.sp),
                width: 50.w,
                backgroundColor: theme.txt,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
