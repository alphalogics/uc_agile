class Singleton {

  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();

  static String? otpUserId;

  static String? userLoginKey;

  static String? eventId;

  static String? eventSlug;

  static String? mainMemId;

  static String? buyerName;

  static String? buyerEmail;

  static String? participants;

}