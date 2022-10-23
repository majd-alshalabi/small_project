import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:small_project/core/constants/constants.dart';
import 'package:small_project/core/constants/font_constants.dart';
import 'package:small_project/core/constants/theme.dart';
import 'package:small_project/core/feature/bloc/theme_bloc/theme_cubit.dart';
import 'package:small_project/core/utils/utils.dart';
import 'package:small_project/core/widget/app_bar.dart';
import 'package:small_project/core/widget/custom_text_field.dart';
import 'package:small_project/core/widget/space.dart';
import 'package:small_project/core/widget/ui_text.dart';
import 'package:small_project/core/widget/user_avatar.dart';
import 'package:small_project/feature/create_user/bloc/create_user_cubit/create_user_cubit.dart';
import 'package:small_project/injection_container.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController hourPrice = TextEditingController();
  final TextEditingController userDescription = TextEditingController();
  final TextEditingController userEnterDate = TextEditingController();
  final TextEditingController userLeaveDate = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    sl<CreateUserCubit>().dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppTheme theme = sl<ThemeCubit>().globalAppTheme;
    return Scaffold(
      appBar: ApplicationAppBar(
        orientation: MediaQuery.of(context).orientation,
        withLeading: true,
        title: UiText(
          'Create User',
          style: TextStyles.montserrat
              .copyWith(fontWeight: FontWeight.w700, fontSize: 12.sp),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5.w),
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: UiText(
                        'Name',
                        style: TextStyles.montserrat.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 12.sp),
                      ),
                    ),
                    CustomTextField(
                      controller: userName,
                      hintText: 'Enter name',
                    )
                  ],
                ),
                VSpace(Insets.sm),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: UiText(
                        'Description',
                        style: TextStyles.montserrat.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 12.sp),
                      ),
                    ),
                    CustomTextField(
                      maxLines: 5,
                      controller: userDescription,
                      hintText: 'Description',
                    )
                  ],
                ),
                VSpace(Insets.sm),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: UiText(
                        'Price Of The Hour',
                        style: TextStyles.montserrat.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 12.sp),
                      ),
                    ),
                    CustomTextField(
                      controller: userName,
                      hintText: 'Enter The Price',
                      keyboardType: TextInputType.number,
                    )
                  ],
                ),
                VSpace(Insets.sm),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: UiText(
                          'Enter Date',
                          style: TextStyles.montserrat.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 12.sp),
                        ),
                      ),
                      InkWell(
                          highlightColor: Colors.transparent,
                          onTap: () {
                            showOmniDateTimePicker(
                              timeSpinnerHighlightedTextStyle:
                                  TextStyles.montserrat.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                              timeSpinnerTextStyle: TextStyles.montserrat
                                  .copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: theme.lightGrey),
                              buttonTextColor: theme.calendarIcon,
                              startInitialDate:
                                  sl<CreateUserCubit>().enterSelectedTime,
                              borderRadius: const Radius.circular(27),
                              primaryColor: theme.calendarIcon,
                              context: context,
                            ).then((value) {
                              if (value != null) {
                                userEnterDate.text = Utils.sysDateFormat(value);
                                sl<CreateUserCubit>().enterSelectedTime = value;
                              }
                            });
                          },
                          child: CustomTextField(
                            hintText: "Day / Month / Year    hh:mm",
                            width: 100.w,
                            controller: userEnterDate,
                            withDropDownIcon: true,
                            enabled: false,
                          )),
                    ],
                  ),
                ),
                VSpace(Insets.sm),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: UiText(
                          'Leave Date',
                          style: TextStyles.montserrat.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 12.sp),
                        ),
                      ),
                      InkWell(
                          highlightColor: Colors.transparent,
                          onTap: () {
                            showOmniDateTimePicker(
                              timeSpinnerHighlightedTextStyle:
                                  TextStyles.montserrat.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                              timeSpinnerTextStyle: TextStyles.montserrat
                                  .copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: theme.lightGrey),
                              buttonTextColor: theme.calendarIcon,
                              startInitialDate:
                                  sl<CreateUserCubit>().leaveSelectedTime,
                              borderRadius: const Radius.circular(27),
                              primaryColor: theme.calendarIcon,
                              context: context,
                            ).then((value) {
                              if (value != null) {
                                userLeaveDate.text = Utils.sysDateFormat(value);
                                sl<CreateUserCubit>().leaveSelectedTime = value;
                              }
                            });
                          },
                          child: CustomTextField(
                            hintText: "Day / Month / Year    hh:mm",
                            width: 100.w,
                            controller: userLeaveDate,
                            withDropDownIcon: true,
                            enabled: false,
                          )),
                    ],
                  ),
                ),
                VSpace(Insets.sm),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: UiText(
                        'User Image',
                        style: TextStyles.montserrat.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 12.sp),
                      ),
                    ),
                    VSpace(Insets.sm),
                    UserAvatar(
                      radius: 15.w,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
