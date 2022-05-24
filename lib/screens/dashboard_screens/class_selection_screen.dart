import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/ui_constants.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/view_model/home_screen_view_models/class_details_view_model.dart';
import 'package:uc_agile/view_model/home_screen_view_models/user_data_view_model.dart';
import 'package:uc_agile/widgets/custom_backpress.dart';
import 'package:uc_agile/widgets/custom_class_details.dart';
import 'package:uc_agile/widgets/full_screen_loader.dart';

import '../dashboard_screen.dart';
import 'class_details_screen.dart';

class ClassSelectionScreen extends StatefulWidget {
  static const String id = "/ClassSelectionScreen";

  @override
  State<ClassSelectionScreen> createState() => _ClassSelectionScreenState();
}

class _ClassSelectionScreenState extends State<ClassSelectionScreen> {

  late ClassDetailViewModel classDetailViewModel;

  @override
  Widget build(BuildContext context) {

    UserDataViewModel userDataViewModel =
    Provider.of<UserDataViewModel>(context);
    classDetailViewModel =
    Provider.of<ClassDetailViewModel>(context);

    return (classDetailViewModel.getAppState == AppState.LOADING) ? FullScreenLoader() : Scaffold(
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(
          "Select Class",
          style: GoogleFonts.barlow(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: CustomBackPress(
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(DashboardScreen.id),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorConst.top_card,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        itemCount: userDataViewModel.getCourseDetails.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {

              getData(userDataViewModel.getCourseDetails[index].eventId.toString());

              // await Provider.of<ClassDetailViewModel>(context,
              //     listen: false)
              //     .getClassDetailsDataResponse(
              //     userDataViewModel.getCourseDetails[index].eventId
              //         .toString()).then((value) {
              //   bool status = classDetailViewModel.getClassStatus;
              //   if (status) {
              //
              //   } else {
              //     showSnackBar(
              //         context: context,
              //         message: classDetailViewModel.getClassMsg);
              //   }
              // }).catchError((e) {
              //   print("Error: $e");
              // });
              print(userDataViewModel.getCourseDetails[index].courseFullName);
            },
            child: CustomClassDetail(
                courseName:
                userDataViewModel.getCourseDetails[index].courseFullName,
                courseImgLink:
                userDataViewModel.getCourseDetails[index].courseLogo),
          );
        },
      ),
    );
  }

  void getData(String courseId) async {
    await Provider.of<ClassDetailViewModel>(context,
        listen: false)
        .getClassDetailsDataResponse(courseId);
    bool status = classDetailViewModel.getClassStatus;
    if (status) {
      Navigator.of(context).pushReplacementNamed(ClassDetailsScreen.id);
    } else {
      showSnackBar(
          context: context,
          message: classDetailViewModel.getClassMsg);
    }

  }

}
