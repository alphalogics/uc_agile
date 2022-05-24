import 'package:flutter/cupertino.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/registration_model/registration_details.dart';

class RegistrationDetailViewModel with ChangeNotifier {

  static const String _getScheduleUrl = '/register/';

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newState) {
    _appState = newState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  late RegistrationDetails _registrationDetails;

  set setRegistrationDetails(RegistrationDetails newRegistrationDetails) {
    _registrationDetails = newRegistrationDetails;
    notifyListeners();
  }

  RegistrationDetails get getRegistrationDetails => _registrationDetails;

  List<String> _countriesData = [];

  set setCountriesData(List<String> newCountriesData) {
    _countriesData = newCountriesData;
    notifyListeners();
  }

  List<String> get getCountriesData => _countriesData;

  List<String> _hearAboutUs = [];

  set setHearAboutUs(List<String> newHearAboutUs) {
    _hearAboutUs = newHearAboutUs;
    notifyListeners();
  }

  List<String> get getHearAboutUs => _hearAboutUs;

  List<String> _timeZone = [];

  set setTimeZone(List<String> newTimeZone){
    _timeZone = newTimeZone;
    notifyListeners();
  }

  List<String> get getTimeZone => _timeZone;

  Future<dynamic> getRegistrationSettingDetails(String action,
      {bool showLoading = true}) async {
    if (showLoading)
      setAppState = AppState.LOADING;

    Map<String, String> _params = {
      'action': action
    };
    try{
      dynamic response = await ApiBaseHelper().get(url: _getScheduleUrl, params: _params);
      RegistrationDetails registrationDetails = RegistrationDetails.fromJson(response);
      setRegistrationDetails = registrationDetails;
      setCountriesData = _registrationDetails.data.countries;
      setHearAboutUs = _registrationDetails.data.hearAboutUs;
      setTimeZone = _registrationDetails.data.convenientTimezone;
      setAppState = AppState.IDLE;
    } on Exception catch(e){
      setAppState = AppState.ERROR;
    }
  }

}