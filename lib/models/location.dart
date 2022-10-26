import 'package:random_api_test/models/coordinates.dart';
import 'package:random_api_test/models/street.dart';
import 'package:random_api_test/models/timezone.dart';

class Location {
  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });
  late final Street street;
  late final String city;
  late final String state;
  late final String country;
  late final String postcode;
  late final Coordinates coordinates;
  late final Timezone timezone;

  Location.fromJson(Map<String, dynamic> json) {
    street = Street.fromJson(json['street']);
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postcode = json['postcode'].toString();
    coordinates = Coordinates.fromJson(json['coordinates']);
    timezone = Timezone.fromJson(json['timezone']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['street'] = street.toJson();
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['postcode'] = postcode;
    data['coordinates'] = coordinates.toJson();
    data['timezone'] = timezone.toJson();
    return data;
  }
}
