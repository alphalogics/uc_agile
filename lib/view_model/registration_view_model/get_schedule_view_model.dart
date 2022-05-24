import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/registration_model/event_schedule.dart';

class ScheduleViewModel with ChangeNotifier {

  static const String _getScheduleUrl = '/register/';

  late EventSchedule _eventSchedule;

  List<Data> _eventData = [];

  set setEventData(List<Data> newEventData) {
    _eventData = newEventData;
    notifyListeners();
  }

  List<Data> get getEventData => _eventData;

  set setEventSchedule(EventSchedule newEventSchedule) {
    _eventSchedule = newEventSchedule;
    notifyListeners();
  }

  EventSchedule get getEventSchedule => _eventSchedule;

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newState) {
    _appState = newState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  Future<dynamic> getEventScheduleDetail(String action,
      {bool showLoading = true}) async {
    if (showLoading)
      setAppState = AppState.LOADING;

    Map<String, String> _params = {
      'action': action
    };
    try{
      dynamic response = await ApiBaseHelper().get(url: _getScheduleUrl, params: _params);
      EventSchedule eventSchedule = EventSchedule.fromJson(response);
      List<Data> _data = [];
      // List<dynamic>
      setEventSchedule = eventSchedule;

      for(int i=0; i < _eventSchedule.data.length; i++){
        _data.add(_eventSchedule.data[i]);
      };

      setEventData = _data;

      setAppState = AppState.IDLE;
    } on Exception catch(e){
      setAppState = AppState.ERROR;
    }
  }

}