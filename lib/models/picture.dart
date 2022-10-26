


class Picture {
  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });
  late final String large;
  late final String medium;
  late final String thumbnail;
  
  Picture.fromJson(Map<String, dynamic> json){
    large = json['large'];
    medium = json['medium'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['large'] = large;
    data['medium'] = medium;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
