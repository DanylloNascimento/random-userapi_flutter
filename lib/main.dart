import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_api_test/controllers/userProvider.dart';
import 'package:random_api_test/views/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserState()),
      ],
      child: MaterialApp(
        theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.blue[900])),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
