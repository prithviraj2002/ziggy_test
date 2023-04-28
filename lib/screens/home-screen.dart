import 'package:flutter/material.dart';
import 'package:ziggy_test/controller/user-data.dart';
import 'package:ziggy_test/screens/add-user.dart';
import 'package:ziggy_test/widgets/user-list-tile.dart';

import '../model/user-model.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          "Ziggy",
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: FutureBuilder(
          future: getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<User> users = snapshot.data;
              return ListView.builder(
                  itemBuilder: (context, i) {
                    return UserTile(u: users[i]);
                  },
                itemCount: users.length,
              );
            } else if (snapshot.hasError) {
              return const Center(child: Icon(Icons.error_outline));
            } else {
              return const Center(child: CircularProgressIndicator(color: Colors.black,),);
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).popAndPushNamed(AddUser.routeName);
        },
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
