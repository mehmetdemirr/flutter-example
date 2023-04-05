import 'package:intl/intl.dart';

class TimePrayModel {
  Place? place;
  Times? times;

  TimePrayModel({this.place, this.times});

  TimePrayModel.fromJson(Map<String, dynamic> json) {
    place = json['place'] != null ? Place.fromJson(json['place']) : null;
    times = json['times'] != null ? Times.fromJson(json['times']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (place != null) {
      data['place'] = place!.toJson();
    }
    if (times != null) {
      data['times'] = times!.toJson();
    }
    return data;
  }
}

class Place {
  String? countryCode;
  String? country;
  String? region;
  String? city;
  double? latitude;
  double? longitude;

  Place(
      {this.countryCode,
      this.country,
      this.region,
      this.city,
      this.latitude,
      this.longitude});

  Place.fromJson(Map<String, dynamic> json) {
    countryCode = json['countryCode'];
    country = json['country'];
    region = json['region'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['countryCode'] = countryCode;
    data['country'] = country;
    data['region'] = region;
    data['city'] = city;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Times {
  List<String>? dateTimeNow;

  Times({this.dateTimeNow});

  Times.fromJson(Map<String, dynamic> json) {
    dateTimeNow =
        json[DateFormat('yyyy-MM-dd').format(DateTime.now())].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[DateFormat('yyyy-MM-dd').format(DateTime.now())] = dateTimeNow;
    return data;
  }
}
