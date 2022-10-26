class Dob {
  Dob({
    required this.date,
    required this.age,
  });
  late final String date;
  late final int age;

  Dob.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    age = json['age'];
  }

  String fullDob() {
    return "Date: $date, Age: $age";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date'] = date;
    data['age'] = age;
    return data;
  }
}
