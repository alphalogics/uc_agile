import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/string_const.dart';
import 'package:uc_agile/app_const/ui_constants.dart';
import 'package:uc_agile/screens/dashboard_screen.dart';
import 'package:uc_agile/view_model/home_screen_view_models/class_details_view_model.dart';
import 'package:uc_agile/widgets/custom_backpress.dart';
import 'package:uc_agile/widgets/custom_class_info.dart';
import 'package:url_launcher/url_launcher.dart';

class ClassDetailsScreen extends StatelessWidget {
  static const String id = "/ClassDetailsScreen";

  @override
  Widget build(BuildContext context) {

    ClassDetailViewModel classDetailViewModel =
    Provider.of<ClassDetailViewModel>(context);

    return Scaffold(
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(
          StringConst.dashboard_title1,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Image.network(classDetailViewModel.getClassCourseLogo),
                    flex: 1,
                  ),
                  Expanded(
                    child: Text(
                      classDetailViewModel.getClassCourseName,
                      style: GoogleFonts.barlow(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              ),
            ),
            ClassInfoCard(
              textDes: "Zoom Link for Day-1",
              urlLink: classDetailViewModel.getClassZoomLinkA,
            ),
            ClassInfoCard(
              textDes: "Zoom Link for Day-2",
              urlLink: classDetailViewModel.getClassZoomLinkB,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 1)),
                ],
                color: Colors.white,
              ),
              child: ExpansionTile(
                title: Text("Password for Zoom Class"),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(classDetailViewModel.getClassZoomPass),
                          flex: 6,
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 10,
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.copy_rounded),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: 'password')).then(
                                    (value) {
                                  showSnackBar(
                                    context: context,
                                    message: "Link Copied to Clipboard",
                                    mColor: Colors.green,
                                  );
                                },
                              );
                            },
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ClassInfoCard(
              textDes: "Miro/Mural Link for the class",
              urlLink: classDetailViewModel.getClassDropboxLink,
            ),
            ClassInfoCard(
              textDes: "Youtube Link for Day-1",
              urlLink: classDetailViewModel.getClassYoutubeLinkA,
            ),
            ClassInfoCard(
              textDes: "Youtube Link for Day-2",
              urlLink: classDetailViewModel.getClassYoutubeLinkB,
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
