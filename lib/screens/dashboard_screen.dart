import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/string_const.dart';
import 'package:uc_agile/app_const/ui_constants.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/screens/dashboard_screens/class_details_screen.dart';
import 'package:uc_agile/screens/dashboard_screens/class_selection_screen.dart';
import 'package:uc_agile/screens/temp_screen.dart';
import 'package:uc_agile/view_model/home_screen_view_models/certificate_email_view_model.dart';
import 'package:uc_agile/view_model/home_screen_view_models/class_details_view_model.dart';
import 'package:uc_agile/view_model/home_screen_view_models/invoice_email_view_model.dart';
import 'package:uc_agile/view_model/home_screen_view_models/user_data_view_model.dart';
import 'package:uc_agile/widgets/custom_class_details.dart';
import 'package:uc_agile/widgets/dashboard_option.dart';
import 'package:uc_agile/widgets/full_screen_loader.dart';
import 'dashboard_screens/refer_friend_screen.dart';

class DashboardScreen extends StatelessWidget {
  static const String id = "/DashboardScreen";

  @override
  Widget build(BuildContext context) {
    ClassDetailViewModel classDetailViewModel =
        Provider.of<ClassDetailViewModel>(context);
    CertificateEmailViewModel certificateEmailViewModel =
        Provider.of<CertificateEmailViewModel>(context);
    InvoiceEmailViewModel invoiceEmailViewModel =
        Provider.of<InvoiceEmailViewModel>(context);
    UserDataViewModel userDataViewModel =
        Provider.of<UserDataViewModel>(context);

    return Scaffold(
            backgroundColor: ColorConst.screen_bg,
            body: (userDataViewModel.getAppState == AppState.LOADING ||
                invoiceEmailViewModel.getAppState == AppState.LOADING ||
                certificateEmailViewModel.getAppState == AppState.LOADING)
                ? FullScreenLoader()
                :  SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorConst.top_card,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 5,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 10),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/avatar.png"),
                          ),
                          // borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Text(
                        userDataViewModel.getUserName,
                        style: GoogleFonts.barlow(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userDataViewModel.getUserEmail,
                        style: GoogleFonts.barlow(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  itemCount: userDataViewModel.getCourseDetails.length,
                  itemBuilder: (context, index) {
                    return CustomClassDetail(
                        courseName: userDataViewModel
                            .getCourseDetails[index].courseFullName,
                        courseImgLink: userDataViewModel
                            .getCourseDetails[index].courseLogo);
                  },
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Services",
                    style: GoogleFonts.barlow(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ColorConst.txt_services,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DashboardOptionItem(
                        bgColor: ColorConst.dashboard_item1,
                        itemText: StringConst.dashboard_option1,
                        onTap: () async {
                          int numClass =
                              userDataViewModel.getCourseDetails.length;

                          if (numClass == 1) {
                            await Provider.of<ClassDetailViewModel>(context,
                                    listen: false)
                                .getClassDetailsDataResponse(userDataViewModel
                                    .getCourseDetails[0].eventId
                                    .toString())
                                .then((value) {
                              bool status = classDetailViewModel.getClassStatus;
                              if (status) {
                                Navigator.of(context)
                                    .pushReplacementNamed(ClassDetailsScreen.id);
                              } else {
                                showSnackBar(
                                    context: context,
                                    message: classDetailViewModel.getClassMsg);
                              }
                            });
                          } else if (numClass > 1) {
                            Navigator.of(context)
                                .pushReplacementNamed(ClassSelectionScreen.id);
                          } else {
                            showSnackBar(
                                context: context, message: "No class found");
                          }
                          print(userDataViewModel.getCourseDetails.length);
                        },
                      ),
                      DashboardOptionItem(
                        bgColor: ColorConst.dashboard_item2,
                        itemText: StringConst.dashboard_option2,
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed(ReferFriendScreen.id),
                      ),
                      DashboardOptionItem(
                        bgColor: ColorConst.dashboard_item3,
                        itemText: StringConst.dashboard_option3,
                        onTap: () async {
                          await Provider.of<InvoiceEmailViewModel>(context,
                                  listen: false)
                              .getInvoiceEmailDataResponse()
                              .then((value) {
                            bool status = certificateEmailViewModel.getCertificateStatus;
                            if(status) {
                              showSnackBar(
                                  context: context,
                                  message:
                                  invoiceEmailViewModel.getInvoiceMsg, mColor: Colors.green);
                            }
                            else {
                              showSnackBar(
                                  context: context,
                                  message:
                                  invoiceEmailViewModel.getInvoiceMsg);
                            }
                          }).catchError((e) {
                            showSnackBar(
                                context: context,
                                message: "Something went wrong / Try Again");
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DashboardOptionItem(
                        bgColor: ColorConst.dashboard_item4,
                        itemText: StringConst.dashboard_option4,
                        onTap: () async {
                          await Provider.of<CertificateEmailViewModel>(context,
                                  listen: false)
                              .getCertificateEmailDataResponse().then((value) {
                            bool status = certificateEmailViewModel.getCertificateStatus;
                            if(status) {
                              showSnackBar(
                                  context: context,
                                  message:
                                  certificateEmailViewModel.getCertificateMsg, mColor: Colors.green);
                            }
                            else {
                              showSnackBar(
                                  context: context,
                                  message:
                                  certificateEmailViewModel.getCertificateMsg);
                            }
                          }).catchError((e) {
                            showSnackBar(
                                context: context,
                                message: "Something went wrong / Try Again");
                          });

                        },
                      ),
                      DashboardOptionItem(
                        bgColor: ColorConst.dashboard_item5,
                        itemText: StringConst.dashboard_option5,
                        onTap: () async {
                          await Share.share('UC Agile invited you download the app from the given link below: https://play.google.com/store/apps/details?id=com.mobileapp.uc_agile', subject: 'UC Agile');
                        }
                      ),
                      DashboardOptionItem(
                        bgColor: ColorConst.dashboard_item6,
                        itemText: StringConst.dashboard_option6,
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed(TempScreen.id),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          );
  }
}
