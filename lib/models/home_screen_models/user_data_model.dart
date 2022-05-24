class UserData {
  UserData({
    required this.status,
    required this.data,
  });
  late final bool status;
  late final Data data;

  UserData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.name,
    required this.email,
    required this.course,
  });
  late final String name;
  late final String email;
  late final List<Course> course;

  Data.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    course = List.from(json['course']).map((e)=>Course.fromJson(e)).toList();
  }
}

class Course {
  Course({
    required this.memberId,
    required this.eventId,
    required this.orderId,
    required this.courseFullName,
    required this.courseLogo,
  });
  late final int memberId;
  late final int eventId;
  late final int orderId;
  late final String courseFullName;
  late final String courseLogo;

  Course.fromJson(Map<String, dynamic> json){
    memberId = json['member_id'];
    eventId = json['event_id'];
    orderId = json['order_id'];
    courseFullName = json['course_full_name'];
    courseLogo = json['course_logo'];
  }
}