import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:small_project/core/constants/font_constants.dart';
import 'package:small_project/core/constants/theme.dart';
import 'package:small_project/core/feature/bloc/theme_bloc/theme_cubit.dart';
import 'package:small_project/injection_container.dart';

class BasicButton extends StatelessWidget {
  final String title;
  final TextStyle? titleTextStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final Function onPressed;
  final double? width;
  final Widget? iconWidget;
  const BasicButton(
      {super.key,
      this.titleTextStyle,
      this.width,
      this.iconWidget,
      this.borderColor,
      this.backgroundColor,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = sl<ThemeCubit>().globalAppTheme;

    return Material(
      borderRadius: BorderRadius.circular(Styles.kBasicButtonRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(Styles.kBasicButtonRadius),
        onTap: () {
          onPressed();
        },
        child: Container(
          width: width ?? 50.w,
          height: 5.5.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                color: borderColor ??
                    (backgroundColor ??
                        theme
                            .primeColor), //                   <--- border color
                width: 0.4.w,
              ),
              color: backgroundColor ?? theme.primeColor,
              borderRadius: const BorderRadius.all(
                  Radius.circular(Styles.kBasicButtonRadius))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconWidget ?? const SizedBox.shrink(),
              Text(title, style: titleTextStyle ?? TextStyles.title1),
            ],
          ),
        ),
      ),
    );
  }
}
