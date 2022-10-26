import 'package:random_api_test/models/results.dart';

class RandomAPI {
  RandomAPI({
    required this.results,
    required this.info,
  });
  late final List<Results> results;
  late final Info info;

  RandomAPI.fromJson(Map<String, dynamic> json) {
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
    info = Info.fromJson(json['info']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['results'] = results.map((e) => e.toJson()).toList();
    data['info'] = info.toJson();
    return data;
  }
}

class Info {
  Info({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });
  late final String seed;
  late final int results;
  late final int page;
  late final String version;

  Info.fromJson(Map<String, dynamic> json) {
    seed = json['seed'];
    results = json['results'];
    page = json['page'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['seed'] = seed;
    data['results'] = results;
    data['page'] = page;
    data['version'] = version;
    return data;
  }
}
