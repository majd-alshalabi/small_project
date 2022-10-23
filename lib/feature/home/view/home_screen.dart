import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:small_project/core/constants/font_constants.dart';
import 'package:small_project/core/widget/app_bar.dart';
import 'package:small_project/core/widget/ui_text.dart';
import 'package:small_project/feature/create_user/view/create_user.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBar(
        orientation: MediaQuery.of(context).orientation,
        // withLeading: true,
        title: UiText(
          'Home',
          style: TextStyles.montserrat
              .copyWith(fontWeight: FontWeight.w700, fontSize: 12.sp),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateUser(),
            )),
      ),
    );
  }
}
