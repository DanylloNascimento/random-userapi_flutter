import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:random_api_test/models/results.dart';
import 'package:random_api_test/models/user.dart';

import '../enums/enums.dart';

class UserState with ChangeNotifier {
  List<Results> users = [];
  late RandomAPI randomAPI;
  viewState _state = viewState.Done;
  viewState get state => _state;
  late String filterSelected;

  void setState(viewState currentState) {
    _state = currentState;
    notifyListeners();
  }

  void setFilterSelected(String filter) {
    filterSelected = filter;
    notifyListeners();
  }

  Future getDataApi() async {
    final url = await http.get(Uri.parse(
        'https://randomuser.me/api/?results=20&gender=$filterSelected'));
    randomAPI = RandomAPI.fromJson(convert.jsonDecode(url.body));
    users = randomAPI.results;
    notifyListeners();
  }

  loadDataUsers() async {
    setState(viewState.IsLoading);
    users = [];
    await getDataApi();
    setState(viewState.Done);
  }
}
