import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_api_test/controllers/userProvider.dart';
import 'package:random_api_test/enums/enums.dart';
import 'package:random_api_test/models/results.dart';
import 'package:random_api_test/models/user.dart';
import 'package:random_api_test/views/User/userView.dart';

const List<String> listGender = <String>['male', 'female'];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late RandomAPI randomAPI;
  late List<Results> list = [];
  String dropdownValue = listGender.first;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Provider.of<UserState>(context, listen: false)
          .setFilterSelected(dropdownValue);

      Provider.of<UserState>(context, listen: false).loadDataUsers(context);
    });

    return Consumer<UserState>(
      builder: (context, userState, _) => Scaffold(
        appBar: AppBar(
          title: const Text("Random Users Api"),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[900],
          tooltip: "Reload",
          child: (userState.state == viewState.IsLoading)
              ? CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.blue[900],
                )
              : const Icon(Icons.refresh_rounded),
          onPressed: () {
            userState.loadDataUsers(context);
          },
        ),
        body: (userState.state == viewState.IsLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Filter by Gender",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: TextStyle(color: Colors.blue[900]),
                          underline: Container(
                            height: 2,
                            color: Colors.blue[900],
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: listGender
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: userState.users.length,
                        itemBuilder: (context, index) => ListTile(
                              leading: Hero(
                                tag: "image$index",
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      userState.users[index].picture.large),
                                ),
                              ),
                              title: Text(
                                userState.users[index].name.fullName(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(userState.users[index].email),
                              trailing: userState.users[index].gender == "male"
                                  ? const Icon(
                                      Icons.male,
                                      size: 30,
                                      color: Colors.blue,
                                    )
                                  : const Icon(
                                      Icons.female,
                                      size: 30,
                                      color: Colors.pink,
                                    ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserView(
                                      users: userState.users[index],
                                    ),
                                  ),
                                );
                              },
                            )),
                  ),
                ],
              ),
      ),
    );
  }
}
