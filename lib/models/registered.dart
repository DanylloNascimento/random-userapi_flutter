class Registered {
  Registered({
    required this.date,
    required this.age,
  });
  late final String date;
  late final int age;

  Registered.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    age = json['age'];
  }

  String fullRegistered() {
    return "Date: $date, Age: $age";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date'] = date;
    data['age'] = age;
    return data;
  }
}
