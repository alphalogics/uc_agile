import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uc_agile/Singleton/singleton_list.dart';
import 'package:uc_agile/app_const/color_const.dart';
import 'package:uc_agile/app_const/ui_constants.dart';
import 'package:uc_agile/enum/app_enum.dart';
import 'package:uc_agile/models/registration_model/event_schedule.dart';
import 'package:uc_agile/screens/registration_screens/buyer_info_screen.dart';
import 'package:uc_agile/view_model/registration_view_model/get_event_data_view_model.dart';
import 'package:uc_agile/view_model/registration_view_model/get_schedule_view_model.dart';
import 'package:uc_agile/widgets/custom_backpress.dart';
import 'package:uc_agile/widgets/custom_event_detail.dart';
import 'package:uc_agile/widgets/custom_flat_button.dart';
import 'package:uc_agile/widgets/full_screen_loader.dart';

import '../welcome_screen.dart';

class GetScheduleScreen extends StatefulWidget {
  static const String id = "GetScheduleScreen";

  @override
  State<GetScheduleScreen> createState() => _GetScheduleScreenState();
}

class _GetScheduleScreenState extends State<GetScheduleScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  List<Data> _filterList = [];

  Color myColor = Colors.white;

  int selectedIndex = 0;

  final String eventAction = 'get_event';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ScheduleViewModel>(context, listen: false)
          .getEventScheduleDetail('get_schedule');
    });

    // getApiDetail();
  }

  @override
  Widget build(BuildContext context) {
    ScheduleViewModel _scheduleViewModel =
        Provider.of<ScheduleViewModel>(context);
    List<Data> _eventListData = _scheduleViewModel.getEventData;
    _filterList = _eventListData
        .where((element) => element.startDate == _selectedDay)
        .toList();
    GetEventDataViewModel getEventDataViewModel = Provider.of<GetEventDataViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose Schedule",
          style: GoogleFonts.barlow(
            color: ColorConst.bar_title,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: CustomBackPress(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(WelcomeScreen.id);
          },
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorConst.appbar_bg,
      ),
      body: (_scheduleViewModel.getAppState == AppState.LOADING || getEventDataViewModel.getAppState == AppState.LOADING) ? FullScreenLoader() : SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: TableCalendar(
                eventLoader: (day) {
                  return _eventListData
                      .where((element) => element.startDate == day)
                      .toList();
                },
                focusedDay: _focusedDay,
                firstDay: DateTime.now(),
                lastDay: DateTime(2050),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: ColorConst.today_date,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: ColorConst.selected_date,
                    shape: BoxShape.circle,
                  ),
                ),
                onDaySelected: (DateTime selectedDay, DateTime focusDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusDay;
                    _filterList = _eventListData
                        .where((element) => element.startDate == _selectedDay)
                        .toList();
                    // print(_filterList);

                    // if(_filterList.isNotEmpty) {
                    //   print(_filterList);
                    //   // ListView.builder(
                    //   //   itemCount: _filterList.length,
                    //   //   itemBuilder: (BuildContext context, int index){
                    //   //     return Text(_filterList[index].instructorName);
                    //   //   },
                    //   // );
                    // }
                    // else {
                    //   print('nikl bsdk');
                    // }

                    // _eventListData.where((element) {
                    //   if(element.startDate == _selectedDay) {
                    //     print('g ${element.startDate}');
                    //     _eventData = element;
                    //   }
                    //   else {
                    //     _eventData = null;
                    //   }
                    // }).toList();

                    // _eventListData.forEach((element) {
                    //   // print('h ${element.startDate}');
                    //
                    // });

                    // _alarmsList.firstWhere((element) {
                    //   if (element.alarmDate == _selectedDay) {
                    //     _selectedEvent = element;
                    //   } else {
                    //     _selectedEvent = null;
                    //   }
                    //   return true;
                    // });

                    // await Provider.of<ScheduleViewModel>(context, listen: false).getEventScheduleDetail('get_schedule');
                    // EventSchedule _event = _scheduleViewModel.getEventSchedule;
                  });
                },
                selectedDayPredicate: (DateTime newDate) {
                  return isSameDay(_selectedDay, newDate);
                },
                startingDayOfWeek: StartingDayOfWeek.monday,
              ),
            ),
            if (_filterList.isNotEmpty)
              // Container(
              //   margin: const EdgeInsets.all(20),
              //   child: Text(
              //     '${_filterList[0].instructorName}\n${_filterList[0].schedule}',
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _filterList.length,
                itemBuilder: (context, index) {
                  return CustomEventDetail(
                    onPressed: () {
                      setState(() {
                        selectedIndex = _filterList[index].id;
                      });
                    },
                    txtInstructorName: _filterList[index].instructorName,
                    txtEventSchedule: _filterList[index].schedule,
                    txtEventTime: _filterList[index].eventTime,
                    imgAvatar: _filterList[index].instructorPhoto,
                    bgColor: selectedIndex == _filterList[index].id ? ColorConst.selected_date : Colors.white,
                  );
                },
              ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        child: CustomFlatButton(
          btnText: 'Confirm Schedule',
          txtColor: Colors.white,
          btnColor: ColorConst.btn_signin,
          onPressed: () async {
            if (selectedIndex == 0) {
              showSnackBar(context: context, message: 'No Event Selected');
            }
            else {
              Singleton.eventId = selectedIndex.toString();
              print(Singleton.eventId);
              await Provider.of<GetEventDataViewModel>(context, listen: false).getEventDataResponse(eventAction, selectedIndex.toString());
              Navigator.of(context)
                  .pushReplacementNamed(BuyerInformationScreen.id);
            }
          }
        ),
      ),
    );
  }
}
