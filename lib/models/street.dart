class Street {
  Street({
    required this.number,
    required this.name,
  });
  late final int number;
  late final String name;

  Street.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
  }

  String fullStreet() {
    return "$name, $number";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['number'] = number;
    data['name'] = name;
    return data;
  }
}
