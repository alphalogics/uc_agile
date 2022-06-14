import 'package:flutter/material.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/models/uc_exclusive/menu_items.dart';

class MenuItems {
  static const tip_trick = UCAgileMenuItem("Tip & Tricks", Icons.album_outlined);
  static const faqs = UCAgileMenuItem("FAQ's", Icons.album_outlined);
  static const videos = UCAgileMenuItem("Videos", Icons.album_outlined);
  static const infographics = UCAgileMenuItem("Infographics", Icons.album_outlined);
  static const podcast = UCAgileMenuItem("Podcasts", Icons.album_outlined);
  static const meeting = UCAgileMenuItem("Meetups", Icons.album_outlined);

  static const all = <UCAgileMenuItem>[
    tip_trick,
    faqs,
    videos,
    infographics,
    podcast,
    meeting,
  ];
}

class MenuItemsScreen extends StatelessWidget {
  static const String id = "MenuItemsScreen";

  final UCAgileMenuItem currentItem;
  final ValueChanged<UCAgileMenuItem> onSelectItem;

  const MenuItemsScreen({
    Key? key,
    required this.currentItem,
    required this.onSelectItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.splash_bg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/avatar.png"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ahmad Ijaz",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "ahmadijaz@gmail.com",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            ...MenuItems.all.map(buildMenuItem).toList(),
            Spacer(
              flex: 2,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorConst.txt_secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(UCAgileMenuItem item) => ListTileTheme(
        selectedColor: Colors.white,
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Container(
          width: 180,
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            selectedTileColor: ColorConst.txt_secondary,
            selected: currentItem == item,
            minLeadingWidth: 20,
            leading: Icon(item.icon),
            title: Text(item.title),
            onTap: () => onSelectItem(item),
          ),
        ),
      );
}
