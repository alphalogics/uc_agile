class GetEventDataModel {
  GetEventDataModel({
    required this.status,
    required this.data,
  });

  late final bool status;
  late final Data data;

  GetEventDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.id,
    required this.className,
    required this.classType,
    required this.state,
    required this.city,
    required this.startDate,
    required this.endDate,
    required this.eventTime,
    required this.showHide,
    required this.isUpcoming,
    required this.instructor,
    required this.retailPrice,
    required this.discountPrice,
    required this.weekendMidweek,
    required this.discountType,
    required this.expirationOveride,
    required this.priceDescription,
    required this.maxParticipants,
    required this.isWaitlist,
    required this.noOfWaitlistParticipants,
    required this.slug,
    required this.saBanner,
    required this.noOfDay,
    required this.isDeleted,
    required this.welcomeMailSent,
    required this.urlZoomDay_1,
    required this.urlZoomDay_2,
    required this.urlMiroBoard,
    required this.courseMaterialsDropboxLink,
    required this.youtubeDay_1,
    required this.youtubeDay_2,
    required this.isSoldOut,
    required this.isThirdParty,
    required this.maxRegistration,
    required this.vendorSeats,
    required this.vendorId,
    required this.couponPopup,
    required this.couponId,
    required this.cityName,
    required this.stateName,
    required this.instructorName,
    required this.instructorEmail,
    required this.instructorPhone,
  });

  late final int id;
  late final String className;
  late final String classType;
  late final int state;
  late final int city;
  late final String startDate;
  late final String endDate;
  late final String eventTime;
  late final String showHide;
  late final String isUpcoming;
  late final int instructor;
  late final String retailPrice;
  late final String discountPrice;
  late final String weekendMidweek;
  late final String discountType;
  late final String expirationOveride;
  late final String priceDescription;
  late final int maxParticipants;
  late final String isWaitlist;
  late final int noOfWaitlistParticipants;
  late final String slug;
  late final String saBanner;
  late final int noOfDay;
  late final int isDeleted;
  late final int welcomeMailSent;
  late final String urlZoomDay_1;
  late final String urlZoomDay_2;
  late final String urlMiroBoard;
  late final String courseMaterialsDropboxLink;
  late final String youtubeDay_1;
  late final String youtubeDay_2;
  late final String isSoldOut;
  late final int isThirdParty;
  late final int maxRegistration;
  late final int vendorSeats;
  late final int vendorId;
  late final int couponPopup;
  late final int couponId;
  late final String cityName;
  late final String stateName;
  late final String instructorName;
  late final String instructorEmail;
  late final String instructorPhone;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    className = json['class_name'];
    classType = json['class'];
    state = json['state'];
    city = json['city'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    eventTime = json['event_time'];
    showHide = json['show_hide'];
    isUpcoming = json['is_upcoming'];
    instructor = json['instructor'];
    retailPrice = json['retail_price'];
    discountPrice = json['discount_price'];
    weekendMidweek = json['weekend_midweek'];
    discountType = json['discount_type'];
    expirationOveride = json['expiration_overide'];
    priceDescription = json['price_description'];
    maxParticipants = json['max_participants'];
    isWaitlist = json['is_waitlist'];
    noOfWaitlistParticipants = json['no_of_waitlist_participants'];
    slug = json['slug'];
    saBanner = json['sa_banner'];
    noOfDay = json['no_of_day'];
    isDeleted = json['is_deleted'];
    welcomeMailSent = json['welcome_mail_sent'];
    urlZoomDay_1 = json['url_zoom_day_1'];
    urlZoomDay_2 = json['url_zoom_day_2'];
    urlMiroBoard = json['url_miro_board'];
    courseMaterialsDropboxLink = json['course_materials_dropbox_link'];
    youtubeDay_1 = json['youtube_day_1'];
    youtubeDay_2 = json['youtube_day_2'];
    isSoldOut = json['is_sold_out'];
    isThirdParty = json['is_third_party'];
    maxRegistration = json['max_registration'];
    vendorSeats = json['vendor_seats'];
    vendorId = json['vendor_id'];
    couponPopup = json['coupon_popup'];
    couponId = json['coupon_id'] == null ? 0 : json['coupon_id'];
    cityName = json['city_name'];
    stateName = json['state_name'];
    instructorName = json['instructor_name'];
    instructorEmail = json['instructor_email'];
    instructorPhone = json['instructor_phone'];
  }
}
