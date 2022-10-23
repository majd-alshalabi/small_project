import 'package:flutter/material.dart';
import 'package:small_project/core/constants/constants.dart';

/// this widget is used to view the user's image
class UserAvatar extends StatelessWidget {
  final String? image;

  /// give the radius of the widget to render
  final double radius;

  /// What should happen on pressing the user avatar
  /// (default is nothing)
  final Function()? onTapAvatar;

  const UserAvatar({
    Key? key,
    this.image,
    this.radius = 25,
    this.onTapAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapAvatar,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: radius,
        child: image == null
            ? Image.asset(
                image ?? Assets.placeHolder,
                fit: BoxFit.fill,
                gaplessPlayback: true,
                errorBuilder: (context, _, __) {
                  return Image.asset(
                    Assets.placeHolder,
                    fit: BoxFit.cover,
                    gaplessPlayback: true,
                  );
                },
              )
            : Image.network(
                image ?? "",
                fit: BoxFit.fill,
                gaplessPlayback: true,
                errorBuilder: (context, _, __) {
                  return Image.asset(
                    Assets.placeHolder,
                    fit: BoxFit.cover,
                    gaplessPlayback: true,
                  );
                },
              ),
      ),
    );
  }
}
