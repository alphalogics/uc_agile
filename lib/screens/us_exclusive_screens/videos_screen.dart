import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/string_const.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/view_model/uc_exclusive_view_model/uc_exclusive_view_model.dart';
import 'package:uc_agile/widgets/full_screen_loader.dart';
import 'package:uc_agile/widgets/general_exclusive_info.dart';
import 'package:uc_agile/widgets/zoom_toggle_btn.dart';

class VideosScreen extends StatefulWidget {

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ExclusiveViewModel>(context, listen: false).getMaterialDataResponse(StringConst.videos_id, '8e176aeed07572c08f2522de1b502501');
    });
  }

  @override
  Widget build(BuildContext context) {

    ExclusiveViewModel exclusiveViewModel = Provider.of<ExclusiveViewModel>(context);

    return Scaffold(
      backgroundColor: ColorConst.screen_bg,
      appBar: AppBar(
        title: Text(
          StringConst.dashboard_title9,
          style: GoogleFonts.barlow(
            color: ColorConst.bar_title,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorConst.appbar_bg,
        leading: ZoomToggle(),
      ),
      body: (exclusiveViewModel.getAppState == AppState.LOADING) ? FullScreenLoader() : Container(
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemCount: exclusiveViewModel.getMaterialList.length,
          itemBuilder: (context, index) {
            return ExclusiveInfo(materialTitle: exclusiveViewModel.getMaterialList[index].title, materialDes: exclusiveViewModel.getMaterialList[index].description,);
          },
        ),
      ),
    );
  }
}
