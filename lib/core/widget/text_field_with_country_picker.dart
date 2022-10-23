import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:small_project/core/constants/font_constants.dart';
import 'package:small_project/core/constants/theme.dart';
import 'package:small_project/core/constants/validators.dart';
import 'package:small_project/core/feature/bloc/theme_bloc/theme_cubit.dart';
import 'package:small_project/injection_container.dart';

/// text filed with a country code picker in the begging of the text field
class TextFieldWithCountryCodePicker extends StatefulWidget {
  const TextFieldWithCountryCodePicker({
    Key? key,
    this.controller,
    this.onChange,
    this.focusNode,
    this.enabled = true,
    this.textInputAction,
    this.hintText,
    this.labelText,
    this.maxLines,
    this.fromAddNewContact = false,
    this.validator,
  }) : super(key: key);

  /// controller for the text
  final TextEditingController? controller;

  /// onChange will return the phone number + the country code
  /// if you want just the phone number use the controller to get it
  final Function(String)? onChange;

  /// text Field focus node
  final FocusNode? focusNode;

  final bool enabled;
  final bool fromAddNewContact;

  /// validation to the input
  final String? Function(String?)? validator;

  final TextInputAction? textInputAction;

  final String? hintText;
  final String? labelText;
  final int? maxLines;

  @override
  State<TextFieldWithCountryCodePicker> createState() =>
      _TextFieldWithCountryCodePickerState();
}

class _TextFieldWithCountryCodePickerState
    extends State<TextFieldWithCountryCodePicker> {
  String codeSelection = '+963';

  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    AppTheme theme = sl<ThemeCubit>().globalAppTheme;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      child: TextFormField(
        enabled: widget.enabled,
        textInputAction: widget.textInputAction,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        focusNode: widget.focusNode,
        style: TextStyles.h4,
        controller: widget.controller ?? TextEditingController(),
        onChanged: (value) {
          phoneNumber = value;
          if (widget.onChange != null) {
            widget.onChange!(codeSelection + phoneNumber);
          }
        },
        textAlignVertical: TextAlignVertical.center,
        validator: !widget.fromAddNewContact
            ? (value) {
                String myPhone = codeSelection + phoneNumber;
                if (Validators.isValidPhone(myPhone.substring(1))) {
                  return null;
                }
                return 'enter valid number';
              }
            : widget.validator,
        keyboardType: const TextInputType.numberWithOptions(
            signed: false, decimal: false),
        cursorColor: theme.grey,
        maxLines: widget.maxLines,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintStyle: TextStyles.h4,
          hintText: widget.hintText,
          labelStyle: TextStyles.h3,
          labelText: widget.labelText,
          prefixIcon: CountryCodePicker(
            dialogTextStyle: TextStyles.h4,
            textStyle: TextStyles.h4.copyWith(color: theme.txt),
            onChanged: (value) {},
            initialSelection: '+963',
            dialogSize: Size(80.w, 80.h),
            flagDecoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3))),
          ),
        ),
      ),
    );
  }
}
