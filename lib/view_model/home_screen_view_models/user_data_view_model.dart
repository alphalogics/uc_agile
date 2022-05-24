import 'package:flutter/cupertino.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/home_screen_models/user_data_model.dart';

class UserDataViewModel with ChangeNotifier {
  static const String _getUserDataURL = '/users/dashboard/';

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newAppState) {
    _appState = newAppState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  late bool _userStatus;

  set setUserStatus(bool newUserStatus) {
    _userStatus = newUserStatus;
    notifyListeners();
  }

  bool get getUserStatus => _userStatus;

  late String _userMsg;

  set setUserMsg(String newUserMsg) {
    _userMsg = newUserMsg;
    notifyListeners();
  }

  String get getUserMsg => _userMsg;

  late String _userName;

  set setUserName(String newUserName) {
    _userName = newUserName;
    notifyListeners();
  }

  String get getUserName => _userName;

  late String _userEmail;

  set setUserEmail(String newUserEmail) {
    _userEmail = newUserEmail;
    notifyListeners();
  }

  String get getUserEmail => _userEmail;

  List<Course> _courseDetails = [];

  set setCourseDetails(List<Course> newCourseDetails) {
    _courseDetails = newCourseDetails;
    notifyListeners();
  }

  List<Course> get getCourseDetails => _courseDetails;

  Future<dynamic> getUserDataResponse({showLoading = true}) async {
    if(showLoading = true) {
      setAppState = AppState.LOADING;
    }

    Map<String, String> _prams = {
      'member_id': Singleton.otpUserId.toString(),
      'key': Singleton.userLoginKey.toString(),
    };

    try {
      dynamic response = await ApiBaseHelper().get(url: _getUserDataURL, params: _prams);
      bool status = response['status'];
      if(status){
        UserData userData = UserData.fromJson(response);
        setUserStatus = userData.status;
        setUserName = userData.data.name;
        setUserEmail = userData.data.email;
        setCourseDetails = userData.data.course;
      }
      else {
        setUserStatus = false;
        setUserMsg = 'Something went wrong / Check your internet connection';
      }
      setAppState = AppState.IDLE;
    } on Exception catch (e) {
      setAppState = AppState.ERROR;
      setUserStatus = false;
      setUserMsg = 'Something went wrong / Check your internet connection';
    }

  }

}