import 'package:flutter/cupertino.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/helper/api_base_helper.dart';
import 'package:uc_agile/models/registration_model/register_participants_model.dart';

class RegisterParticipantsViewModel with ChangeNotifier {
  static const String _postRegisterParticipantsURL = '/register/';

  AppState _appState = AppState.IDLE;

  set setAppState(AppState newAppState) {
    _appState = newAppState;
    notifyListeners();
  }

  AppState get getAppState => _appState;

  late bool _partStatus;

  set setPartStatus(bool newPartStatus) {
    _partStatus = newPartStatus;
    notifyListeners();
  }

  bool get getPartStatus => _partStatus;

  late String _partMsg;

  set setPartMsg(String newPartMsg) {
    _partMsg = newPartMsg;
    notifyListeners();
  }

  String get getPartMsg => _partMsg;

  Future<dynamic> addParticipantsDataResponse(
      String action,
      String buyerId,
      String eventId,
      String eventSlug,
      String participants,
      List<String> participantsFName,
      List<String> participantsLName,
      List<String> participantsEmail,
      List<String> participantsPhone,
      String sEmail,
      String aboutUs,
      String timeZone,
      {showLoading = true}) async {
    if (showLoading) {
      setAppState = AppState.LOADING;
    }

    Map<String, dynamic> _body = {
      'action': action,
      'reg_buyer_id': buyerId,
      'reg_event_id': eventId,
      'reg_event_slug': eventSlug,
      'no_of_participants': participants,
      'mem_fname[]': participantsFName,
      'mem_lname[]': participantsLName,
      'mem_email[]': participantsEmail,
      'mem_phone[]': participantsPhone,
      'mem_secondary_email': sEmail,
      'hear_about_us': aboutUs,
      'convenient_timezone': timeZone,
    };

    try {
      dynamic response = await ApiBaseHelper().post(url: _postRegisterParticipantsURL, body: _body);
      bool status = response['status'];
      if(status) {
        RegisterParticipantsModel participantsModel = RegisterParticipantsModel.fromJson(response);
        setPartStatus = participantsModel.data.status;
        setPartMsg = participantsModel.data.message;
      }
      else {
        setPartStatus = response['status'];
        setPartMsg = response['message'][0];
      }
      setAppState = AppState.IDLE;
    } on Exception catch (e) {
      setAppState = AppState.ERROR;
      setPartStatus = false;
      setPartMsg = 'Something went wrong / Try Again';
    }
  }
}
