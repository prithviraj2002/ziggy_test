import 'package:flutter/material.dart';
import 'package:ziggy_test/screens/add-user.dart';
import 'package:ziggy_test/screens/home-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const HomeScreen(),
      routes: {
        HomeScreen.routeName : (ctx) => const HomeScreen(),
        AddUser.routeName : (ctx) => const AddUser()
      },
    );
  }
}

