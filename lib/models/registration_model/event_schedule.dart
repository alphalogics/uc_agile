class EventSchedule {
  EventSchedule({
    required this.status,
    required this.data,
  });
  late final bool status;
  late final List<Data> data;



  EventSchedule.fromJson(Map<String, dynamic> json){
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

}

class Data {
  Data({
    required this.id,
    required this.schedule,
    required this.startDate,
    required this.endDate,
    required this.eventTime,
    required this.instructorId,
    required this.instructorName,
    required this.instructorPhoto,
  });
  late final int id;
  late final String schedule;
  late final DateTime startDate;
  late final String endDate;
  late final String eventTime;
  late final int instructorId;
  late final String instructorName;
  late final String instructorPhoto;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    schedule = json['schedule'];
    startDate = DateTime.parse(json['start_date'] + ' 00:00:00.000Z');
    endDate = json['end_date'];
    eventTime = json['event_time'];
    instructorId = json['instructor_id'];
    instructorName = json['instructor_name'];
    instructorPhoto = json['instructor_photo'];
  }

}