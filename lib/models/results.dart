import 'package:random_api_test/models/dob.dart';
import 'package:random_api_test/models/id.dart';
import 'package:random_api_test/models/location.dart';
import 'package:random_api_test/models/login.dart';
import 'package:random_api_test/models/name.dart';
import 'package:random_api_test/models/picture.dart';
import 'package:random_api_test/models/registered.dart';

class Results {
  Results({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });
  late final String gender;
  late final Name name;
  late final Location location;
  late final String email;
  late final Login login;
  late final Dob dob;
  late final Registered registered;
  late final String phone;
  late final String cell;
  late final Id id;
  late final Picture picture;
  late final String nat;

  Results.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    name = Name.fromJson(json['name']);
    location = Location.fromJson(json['location']);
    email = json['email'];
    login = Login.fromJson(json['login']);
    dob = Dob.fromJson(json['dob']);
    registered = Registered.fromJson(json['registered']);
    phone = json['phone'];
    cell = json['cell'];
    id = Id.fromJson(json['id']);
    picture = Picture.fromJson(json['picture']);
    nat = json['nat'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['gender'] = gender;
    data['name'] = name.toJson();
    data['location'] = location.toJson();
    data['email'] = email;
    data['login'] = login.toJson();
    data['dob'] = dob.toJson();
    data['registered'] = registered.toJson();
    data['phone'] = phone;
    data['cell'] = cell;
    data['id'] = id.toJson();
    data['picture'] = picture.toJson();
    data['nat'] = nat;
    return data;
  }
}
