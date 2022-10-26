class Timezone {
  Timezone({
    required this.offset,
    required this.description,
  });
  late final String offset;
  late final String description;

  Timezone.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    description = json['description'];
  }

  String fullTimezone() {
    return "Offset: $offset, Description: $description";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['offset'] = offset;
    data['description'] = description;
    return data;
  }
}
