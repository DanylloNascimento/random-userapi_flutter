class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });
  late final String latitude;
  late final String longitude;

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  String fullCoordinates() {
    return "Lat: $latitude, Long: $longitude";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
