import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_api_test/controllers/checkConnectivy.dart';
import 'package:random_api_test/models/results.dart';
import 'package:random_api_test/models/user.dart';

import '../enums/enums.dart';

class UserState with ChangeNotifier {
  List<Results> users = [];
  late RandomAPI randomAPI;
  viewState _state = viewState.Done;
  viewState get state => _state;
  late String filterSelected;
  CheckConnectivy checkConnectivy = CheckConnectivy();

  void setState(viewState currentState) {
    _state = currentState;
    notifyListeners();
  }

  void setFilterSelected(String filter) {
    filterSelected = filter;
    notifyListeners();
  }

  Future getDataApi(BuildContext context) async {
    if (await checkConnectivy.checkConnectivy()) {
      try {
        final url = await http.get(Uri.parse(
            'https://randomuser.me/api/?results=20&gender=$filterSelected'));
        randomAPI = RandomAPI.fromJson(convert.jsonDecode(url.body));
        users = randomAPI.results;
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error: Incorrect data"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Text("Check the api link that was used")
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blue[900])),
                  child: const Text("Ok"),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    child: const Text("Cancel")),
              ],
            );
          },
        );
      }

      notifyListeners();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error: No connection"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[Text("Check your internet connection")],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blue[900])),
                child: const Text("Ok"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  child: const Text("Cancel")),
            ],
          );
        },
      );
    }
  }

  loadDataUsers(BuildContext context) async {
    setState(viewState.IsLoading);
    users = [];
    await getDataApi(context);
    setState(viewState.Done);
  }
}
