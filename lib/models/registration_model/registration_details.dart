class RegistrationDetails {
  RegistrationDetails({
    required this.status,
    required this.data,
  });
  late final bool status;
  late final Data data;

  RegistrationDetails.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.countries,
    required this.hearAboutUs,
    required this.convenientTimezone,
    required this.paymentMethod,
    required this.eventPlusTransactionCharge,
    required this.splititServiceCharge,
  });
  late final List<String> countries;
  late final List<String> hearAboutUs;
  late final List<String> convenientTimezone;
  late final PaymentMethod paymentMethod;
  late final int eventPlusTransactionCharge;
  late final int splititServiceCharge;

  Data.fromJson(Map<String, dynamic> json){
    countries = List.castFrom<dynamic, String>(json['countries']);
    hearAboutUs = List.castFrom<dynamic, String>(json['hear_about_us']);
    convenientTimezone = List.castFrom<dynamic, String>(json['convenient_timezone']);
    paymentMethod = PaymentMethod.fromJson(json['payment_method']);
    eventPlusTransactionCharge = json['event_plus_transaction_charge'];
    splititServiceCharge = json['splitit_service_charge'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['countries'] = countries;
    _data['hear_about_us'] = hearAboutUs;
    _data['convenient_timezone'] = convenientTimezone;
    _data['payment_method'] = paymentMethod.toJson();
    _data['event_plus_transaction_charge'] = eventPlusTransactionCharge;
    _data['splitit_service_charge'] = splititServiceCharge;
    return _data;
  }
}

class PaymentMethod {
  PaymentMethod({
    required this.stripe,
    required this.splitit,
  });
  late final Stripe stripe;
  late final Splitit splitit;

  PaymentMethod.fromJson(Map<String, dynamic> json){
    stripe = Stripe.fromJson(json['stripe']);
    splitit = Splitit.fromJson(json['splitit']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['stripe'] = stripe.toJson();
    _data['splitit'] = splitit.toJson();
    return _data;
  }
}

class Stripe {
  Stripe({
    required this.name,
    required this.paymentUrl,
  });
  late final String name;
  late final String paymentUrl;

  Stripe.fromJson(Map<String, dynamic> json){
    name = json['name'];
    paymentUrl = json['payment_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['payment_url'] = paymentUrl;
    return _data;
  }
}

class Splitit {
  Splitit({
    required this.name,
    required this.paymentUrl,
  });
  late final String name;
  late final String paymentUrl;

  Splitit.fromJson(Map<String, dynamic> json){
    name = json['name'];
    paymentUrl = json['payment_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['payment_url'] = paymentUrl;
    return _data;
  }
}