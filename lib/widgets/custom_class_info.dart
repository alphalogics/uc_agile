import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/ui_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ClassInfoCard extends StatelessWidget {
  final String textDes;
  final String urlLink;

  ClassInfoCard({required this.textDes, required this.urlLink});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        title: Text("$textDes"),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: urlLink == '' ? Text('Url not found') : Text("$urlLink"),
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
                      Clipboard.setData(ClipboardData(text: urlLink)).then(
                        (value) {
                          showSnackBar(
                              context: context,
                              message: "Copied to Clipboard",
                              mColor: Colors.green,
                          );
                        },
                      );
                    },
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: SizedBox(
                    width: 5,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.launch),
                    onPressed: () {
                      launch(urlLink).catchError((e) {
                        showSnackBar(context: context, message: "Url not found or Invalid Url");
                      });
                    },
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
