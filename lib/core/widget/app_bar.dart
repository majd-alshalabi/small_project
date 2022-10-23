import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// this is the general app bar for twin app
class ApplicationAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// widgets to appear at the end of the app bar
  final List<Widget>? actions;

  /// the primary widget displayed in the app bar.
  final Widget? title;

  ///whether to show a back button or not
  final bool? withLeading;
  final Widget? leading;
  final double? leadingWidth;
  final double? titleSpacing;

  /// what to do when pressing the leading button
  final Function()? onPressLeadingButton;

  /// to add something like tab bar
  final PreferredSizeWidget? bottom;

  /// mobile orientation
  /// use [MediaQuery.of(context).orientation]
  final Orientation orientation;

  /// color of the appbar
  final Color? backgroundColor;

  /// the elevation of the appbar
  final double? elevation;

  final Color? leadingColor;
  final bool centerTitle;
  const ApplicationAppBar({
    /// if key is provided it must be unique,
    /// don't use "TwinAppBar" or repeated,random keys
    Key? key,
    this.withLeading = false,
    this.actions,
    this.title,
    this.onPressLeadingButton,
    this.bottom,
    required this.orientation,
    this.leading,
    this.leadingWidth,
    this.titleSpacing,
    this.backgroundColor,
    this.elevation,
    this.leadingColor,
    this.centerTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      key: Key("${key.toString()}TwinAppBar"),
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      leading: withLeading!
          ? leading ??
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios))
          : null,
      leadingWidth: withLeading!
          ? leadingWidth ?? (orientation == Orientation.portrait ? 10.w : 8.h)
          : null,
      title: title,
      actions: actions,
      bottom: bottom,
      titleSpacing: titleSpacing,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        bottom == null
            ? orientation == Orientation.portrait
                ? 8.h
                : 14.w
            : orientation == Orientation.portrait
                ? 13.h
                : 25.w,
      );
}
