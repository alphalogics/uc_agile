class ClassDetails {
  ClassDetails({
    required this.status,
    required this.data,
  });
  late final bool status;
  late final Data data;

  ClassDetails.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.urlZoomDay_1,
    required this.urlZoomDay_2,
    required this.urlMiroBoard,
    required this.courseMaterialsDropboxLink,
    required this.youtubeDay_1,
    required this.youtubeDay_2,
    required this.courseFullName,
    required this.courseLogo,
    required this.zoomPassword,
  });
  late final String urlZoomDay_1;
  late final String urlZoomDay_2;
  late final String urlMiroBoard;
  late final String courseMaterialsDropboxLink;
  late final String youtubeDay_1;
  late final String youtubeDay_2;
  late final String courseFullName;
  late final String courseLogo;
  late final String zoomPassword;

  Data.fromJson(Map<String, dynamic> json){
    urlZoomDay_1 = json['url_zoom_day_1'];
    urlZoomDay_2 = json['url_zoom_day_2'];
    urlMiroBoard = json['url_miro_board'];
    courseMaterialsDropboxLink = json['course_materials_dropbox_link'];
    youtubeDay_1 = json['youtube_day_1'];
    youtubeDay_2 = json['youtube_day_2'];
    courseFullName = json['course_full_name'];
    courseLogo = json['course_logo'];
    zoomPassword = json['zoom_password'];
  }
}