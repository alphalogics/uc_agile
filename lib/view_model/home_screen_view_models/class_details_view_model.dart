import 'package:flutter/cupertino.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/home_screen_models/class_details_model.dart';

class ClassDetailViewModel with ChangeNotifier {
  static const String _getClassDetailURL = '/users/event/';

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newAppState) {
    _appState = newAppState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  late bool _classStatus;

  set setClassStatus(bool newClassStatus) {
    _classStatus = newClassStatus;
    notifyListeners();
  }

  bool get getClassStatus => _classStatus;

  late String _classMsg;

  set setClassMsg(String newClassMsg) {
    _classMsg = newClassMsg;
    notifyListeners();
  }

  String get getClassMsg => _classMsg;

  late String _classZoomLinkA;

  set setClassZoomLinkA(String newClassZoomLinkA) {
    _classZoomLinkA = newClassZoomLinkA;
    notifyListeners();
  }

  String get getClassZoomLinkA => _classZoomLinkA;

  late String _classZoomLinkB;

  set setClassZoomLinkB(String newClassZoomLinkB) {
    _classZoomLinkB = newClassZoomLinkB;
    notifyListeners();
  }

  String get getClassZoomLinkB => _classZoomLinkB;

  late String _classYoutubeLinkA;

  set setClassYoutubeLinkA(String newClassYoutubeLinkA) {
    _classYoutubeLinkA = newClassYoutubeLinkA;
    notifyListeners();
  }

  String get getClassYoutubeLinkA => _classYoutubeLinkA;

  late String _classYoutubeLinkB;

  set setClassYoutubeLinkB(String newClassYoutubeLinkB) {
    _classYoutubeLinkB = newClassYoutubeLinkB;
    notifyListeners();
  }

  String get getClassYoutubeLinkB => _classYoutubeLinkB;

  late String _classDropboxLink;

  set setClassDropboxLink(String newClassDropboxLink) {
    _classDropboxLink = newClassDropboxLink;
    notifyListeners();
  }

  String get getClassDropboxLink => _classDropboxLink;

  late String _classZoomPass;

  set setClassZoomPass(String newClassZoomPass) {
    _classZoomPass = newClassZoomPass;
    notifyListeners();
  }

  String get getClassZoomPass => _classZoomPass;

  late String _classCourseName;

  set setClassCourseName(String newClassCourseName) {
    _classCourseName = newClassCourseName;
    notifyListeners();
  }

  String get getClassCourseName => _classCourseName;

  late String _classCourseLogo;

  set setClassCourseLogo(String newClassCourseLogo) {
    _classCourseLogo = newClassCourseLogo;
    notifyListeners();
  }

  String get getClassCourseLogo => _classCourseLogo;

  Future<dynamic> getClassDetailsDataResponse(String classId, {showLoading = true}) async {
    if(showLoading = true) {
      setAppState = AppState.LOADING;
    }

    Map<String, String> _prams = {
      'action': 'get_class_details',
      'class_id': classId,
      'key': Singleton.userLoginKey.toString(),
    };

    try {
      dynamic response = await ApiBaseHelper().get(url: _getClassDetailURL, params: _prams);
      bool status = response['status'];
      if(status){
        ClassDetails classDetails = ClassDetails.fromJson(response);
        setClassStatus = classDetails.status;
        setClassZoomLinkA = classDetails.data.urlZoomDay_1;
        setClassZoomLinkB = classDetails.data.urlZoomDay_2;
        setClassCourseLogo = classDetails.data.courseLogo;
        setClassCourseName = classDetails.data.courseFullName;
        setClassDropboxLink = classDetails.data.courseMaterialsDropboxLink;
        setClassZoomPass = classDetails.data.zoomPassword;
        setClassYoutubeLinkA = classDetails.data.youtubeDay_1;
        setClassYoutubeLinkB = classDetails.data.youtubeDay_2;
      }
      else {
        setClassStatus = false;
        setClassMsg = response['message'][0];
      }
      setAppState = AppState.IDLE;
    } on Exception catch (e) {
      setAppState = AppState.ERROR;
      setClassStatus = false;
      setClassMsg = 'Something went wrong / Try Again';
    }

  }

}