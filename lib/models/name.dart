class Name {
  Name({
    required this.title,
    required this.first,
    required this.last,
  });
  late final String title;
  late final String first;
  late final String last;

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
  }

  String fullName() {
    return "$title $first $last";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['first'] = first;
    data['last'] = last;
    return data;
  }
}
