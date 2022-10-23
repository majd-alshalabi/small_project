import 'package:flutter/material.dart';
import 'package:small_project/core/constants/font_constants.dart';

class UiText extends StatelessWidget {
  const UiText(
    this.text, {
    Key? key,
    this.style,
    this.maxLines,
  }) : super(key: key);
  final String text;
  final TextStyle? style;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.fade,
      style: style ?? TextStyles.h4,
      maxLines: maxLines,
    );
  }
}
