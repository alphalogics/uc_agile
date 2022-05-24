import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/models/uc_exclusive/uc_exclusive_model.dart';
import 'package:uc_agile/screens/login_screens/signin_screen.dart';
import 'package:uc_agile/screens/registration_screens/confirm_detail_screen.dart';
import 'package:uc_agile/screens/registration_screens/get_schedule_screen.dart';
import 'package:uc_agile/screens/us_exclusive_screens/menu_screen.dart';
import 'package:uc_agile/screens/us_exclusive_screens/tip_tricks_screen.dart';
import 'package:uc_agile/view_model/uc_exclusive_view_model/uc_exclusive_view_model.dart';
import 'package:uc_agile/widgets/custom_flat_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = "/WelcomeScreen";

  @override
  Widget build(BuildContext context) {
    // ScheduleViewModel _scheduleViewModel = Provider.of<ScheduleViewModel>(context);
    ExclusiveViewModel _model = Provider.of<ExclusiveViewModel>(context);
    return Scaffold(
        backgroundColor: ColorConst.welcome_screen_bg,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text(
                      "Welcome to\nUnusual Concept",
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "The Most Trusted and Advanced\nScrum Training Academy",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  CustomFlatButton(
                    btnText: "Create an account",
                    btnColor: ColorConst.btn_create_account,
                    txtColor: Colors.white,
                    onPressed: () async {

                      // await Provider.of<GetEventDataViewModel>(context, listen: false).getEventDataResponse('get_event', '385');
                      Navigator.of(context).pushReplacementNamed(GetScheduleScreen.id);
                      // Navigator.of(context).pushReplacementNamed(ConfirmDetailScreen.id);
                      // await Provider.of<ScheduleViewModel>(context, listen: false).getEventScheduleDetail('get_schedule');
                      // EventSchedule _event = _scheduleViewModel.getEventSchedule;
                      // print(_event.data.length);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 30),
                    child: CustomFlatButton(
                      btnText: "Sign In",
                      btnColor: Colors.white,
                      txtColor: Colors.black,
                      onPressed: () async {
                        // await Provider.of<ExclusiveViewModel>(context, listen: false).getMaterialDataResponse('6', '8e176aeed07572c08f2522de1b502501');
                        // Navigator.of(context).pushReplacementNamed(SignInScreen.id);
                        Navigator.of(context).pushReplacementNamed(MenuScreen.id);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}


// class WelcomeScreen extends StatelessWidget {
//   static const String id = "/WelcomeScreen";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: ColorConst.welcome_screen_bg,
//         body: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(top: 60),
//                     child: Text(
//                       "Welcome to\nSmart Tuition",
//                       style: TextStyle(
//                         fontSize: 24,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 10),
//                     child: Text(
//                       "The Most Trusted and Advanced\nEducation Academy System",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   CustomFlatButton(
//                     btnText: "Create an account",
//                     btnColor: ColorConst.btn_create_account,
//                     txtColor: Colors.white,
//                     onPressed: () => Navigator.of(context).pushReplacementNamed(ConfirmDetailScreen.id),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 20, bottom: 30),
//                     child: CustomFlatButton(
//                       btnText: "Sign In",
//                       btnColor: Colors.white,
//                       txtColor: Colors.black,
//                       onPressed: () => Navigator.of(context).pushReplacementNamed(SignInScreen.id),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }
