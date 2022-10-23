import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:small_project/core/constants/constants.dart';
import 'package:small_project/core/constants/font_constants.dart';
import 'package:small_project/core/widget/app_bar.dart';
import 'package:small_project/core/widget/space.dart';
import 'package:small_project/core/widget/ui_text.dart';
import 'package:small_project/core/widget/user_avatar.dart';
import 'package:small_project/feature/create_user/view/create_user.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<TempModel> li = [
    TempModel(name: 'ahmad', startingDate: '6/6/2020 10:05', totalSalary: 2000),
    TempModel(name: 'ahmad', startingDate: '6/6/2020 10:05', totalSalary: 2000),
    TempModel(name: 'ahmad', startingDate: '6/6/2020 10:05', totalSalary: 2000),
    TempModel(name: 'ahmad', startingDate: '6/6/2020 10:05', totalSalary: 2000),
    TempModel(name: 'ahmad', startingDate: '6/6/2020 10:05', totalSalary: 2000),
  ];

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
      body: ListView.separated(
        itemCount: li.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    UserAvatar(
                      radius: 5.h,
                    ),
                    HSpace(Insets.sm),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UiText(li[index].name ?? ""),
                        UiText(
                          li[index].startingDate ?? "",
                          style: TextStyles.h5.copyWith(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
                UiText("${li[index].totalSalary.toString()} \$")
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          if (index != li.length - 1) {
            return const Divider();
          }
          return const Offstage();
        },
      ),
    );
  }
}

class TempModel {
  String? name;
  int? totalSalary;
  String? startingDate;
  TempModel({this.name, this.startingDate, this.totalSalary});
}
