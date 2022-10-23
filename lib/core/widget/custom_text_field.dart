import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:small_project/core/constants/font_constants.dart';
import 'package:small_project/core/constants/theme.dart';
import 'package:small_project/core/feature/bloc/theme_bloc/theme_cubit.dart';
import 'package:small_project/injection_container.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.onChange,
    this.maxLines = 1,
    this.validator,
    this.hintText = '',
    this.width,
    this.enabled,
    this.withDropDownIcon,
    this.focusNode,
    this.textFieldKey,
    this.autoFocus = false,
    this.textInputAction,
    this.keyboardType,
    this.labelText,
    this.limitLength,
    this.maxLength,
  }) : super(key: key);

  /// controller for the text
  final TextEditingController controller;

  /// onChange function return String
  final Function(String)? onChange;

  /// validation to the input
  final String? Function(String?)? validator;

  /// text field max lines
  final int? maxLines;

  /// text field label
  final String hintText;

  /// text Field focus node
  final FocusNode? focusNode;

  // width
  final double? width;

  // dropdown icon at end text field
  final bool? withDropDownIcon;

  // to make text field readonly
  final bool? enabled;

  final bool autoFocus;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? labelText;
  final GlobalKey? textFieldKey;

  final int? limitLength;
  final int? maxLength;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextDirection textDirection = TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = sl<ThemeCubit>().globalAppTheme;
    return SizedBox(
      width: widget.width ?? MediaQuery.of(context).size.width * 0.95,
      child: TextFormField(
        inputFormatters: widget.limitLength != null
            ? [
                LengthLimitingTextInputFormatter(widget.limitLength),
              ]
            : null,
        selectionControls: CupertinoTextSelectionControls(),
        key: widget.textFieldKey,
        textDirection: textDirection,
        autofocus: widget.autoFocus,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        focusNode: widget.focusNode,
        enabled: widget.enabled ?? true,
        style: const TextStyle(
          fontFamily: Fonts.montserrat,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
          letterSpacing: 0,
          height: 1,
        ),
        controller: widget.controller,
        onChanged: (value) {
          if (widget.onChange != null) {
            widget.onChange!(value);
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: widget.maxLines,
        validator: widget.validator ??
            (v) {
              return null;
            },
        maxLength: widget.maxLength,
        cursorColor: theme.grey,
        decoration: InputDecoration(
          hintStyle: TextStyles.h4,
          hintText: widget.hintText,
          suffixIcon:
              (widget.withDropDownIcon != null && widget.withDropDownIcon!)
                  ? const Icon(Icons.arrow_drop_down)
                  : null,
          labelText: widget.labelText,
          labelStyle: TextStyles.h3,
        ),
      ),
    );
  }
}
