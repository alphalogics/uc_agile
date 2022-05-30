import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:uc_agile/models/uc_exclusive/menu_items.dart';
import 'package:uc_agile/screens/us_exclusive_screens/infographics_screen.dart';
import 'package:uc_agile/screens/us_exclusive_screens/meetups_screen.dart';
import 'package:uc_agile/screens/us_exclusive_screens/podcasts_screen.dart';
import 'package:uc_agile/screens/us_exclusive_screens/tip_tricks_screen.dart';
import 'package:uc_agile/screens/us_exclusive_screens/videos_screen.dart';

import 'faq_screen.dart';
import 'menu_items_screen.dart';

class MenuScreen extends StatefulWidget {
  static const String id = "MenuScreen";

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  MenuItem currentItem = MenuItems.tip_trick;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) => MenuItemsScreen(
            currentItem: currentItem,
            onSelectItem: (item) {
              setState(() => currentItem = item);
              ZoomDrawer.of(context)!.close();
            }),
      ),
      mainScreen: getScreen(),
      style: DrawerStyle.Style1,
      borderRadius: 40,
      showShadow: true,
      angle: -0.0,
      // drawerShadowsBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      slideWidth: MediaQuery.of(context).size.width * 0.7,
    );
  }

  Widget getScreen() {

    if(currentItem == MenuItems.tip_trick) {
      return TipTricksScreen();
    }
    else if(currentItem == MenuItems.faqs) {
      return FAQScreen();
    }
    else if(currentItem == MenuItems.videos) {
      return VideosScreen();
    }
    else if(currentItem == MenuItems.infographics) {
      return InfographicsScreen();
    }
    else if(currentItem == MenuItems.podcast) {
      return PodcastsScreen();
    }
    else {
      return MeetupsScreen();
    }
  }
}
