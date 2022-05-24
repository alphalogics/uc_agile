import 'package:flutter/cupertino.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/registration_model/get_event_data_model.dart';

class GetEventDataViewModel with ChangeNotifier {

  static const String _getEventDataUrl = '/register/';

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newAppState) {
    _appState = newAppState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  late bool _eventStatus;

  set setEventStatus(bool newEventStatus) {
    _eventStatus = newEventStatus;
    notifyListeners();
  }

  bool get getEventStatus => _eventStatus;

  late String _eventMsg;

  set setEventMsg(String newEventMsg) {
    _eventMsg = newEventMsg;
    notifyListeners();
  }

  String get getEventMsg => _eventMsg;

  Future<dynamic> getEventDataResponse(String action, String eventId, {showLoading = true}) async {
    if(showLoading) {
      setAppState = AppState.LOADING;
    }

    Map<String, String> _params = {
      'action': action,
      'event_id': eventId,
    };

    try {
      dynamic response = await ApiBaseHelper().get(url: _getEventDataUrl, params: _params);
      bool status = response['status'];
      if (status) {
        GetEventDataModel getEventDataModel = GetEventDataModel.fromJson(response);
        setEventStatus = getEventDataModel.status;
        setEventMsg = 'Successful';
        Singleton.eventSlug = getEventDataModel.data.slug;
        print(getEventDataModel.data);
      }
      else {
        setEventStatus = response['status'];
        setEventMsg = response['message'][0];
        print(response['message'][0]);
      }
      setAppState = AppState.IDLE;
    } on Exception catch (e) {
      setAppState = AppState.ERROR;
      setEventStatus = false;
      setEventMsg = 'Something went wrong / Try Again';
    }

  }



}