import 'package:flutter/material.dart';
import 'package:random_api_test/models/results.dart';

class UserView extends StatelessWidget {
  const UserView({super.key, required this.users});

  final Results users;

  @override
  Widget build(BuildContext context) {
    final double sizeHeight = MediaQuery.of(context).size.height;
    // var userState = Provider.of<UserState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${users.name.first} ${users.name.last}"),
        centerTitle: false,
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(0.0),
                height: sizeHeight * 0.2,
                decoration: const BoxDecoration(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  padding: EdgeInsets.only(top: sizeHeight * 0.15),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: sizeHeight * 0.13, bottom: sizeHeight * 0.05),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  "${users.name.first} ${users.name.last}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0),
                                ),
                                users.gender == "male"
                                    ? const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.male,
                                          color: Colors.blue,
                                        ),
                                      )
                                    : const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.female,
                                          color: Colors.pink,
                                        ),
                                      )
                              ],
                            ),
                            Text(
                              "Dob: ${users.dob.fullDob()}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Regist: ${users.registered.fullRegistered()}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "E-mail: ${users.email}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.phone),
                                const Padding(padding: EdgeInsets.all(4)),
                                Text(
                                  users.phone,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.phone_android),
                                const Padding(padding: EdgeInsets.all(4)),
                                Text(
                                  users.cell,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.all(10)),
                            const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Username: ${users.login.username}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Password: ${users.login.password}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Salt: ${users.login.salt}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Padding(padding: EdgeInsets.all(10)),
                            const Text(
                              "Location",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Padding(padding: EdgeInsets.all(2)),
                            Text(
                              "Street: ${users.location.street.fullStreet()}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "City: ${users.location.city}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "State: ${users.location.state}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Country: ${users.location.country}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Postcode: ${users.location.postcode}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Coordinates: ${users.location.coordinates.fullCoordinates()}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Timezone: ${users.location.timezone.fullTimezone()}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: sizeHeight * 0.02),
                child: Center(
                  child: Hero(
                    tag: "image",
                    child: CircleAvatar(
                      radius: 100.0,
                      backgroundImage: NetworkImage(users.picture.large),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
