class Id {
  Id({
    required this.name,
    required this.value,
  });
  late final String name;
  late final String value;

  Id.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'] != null ? json['value'] : "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}
