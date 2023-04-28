import 'package:flutter/material.dart';
import 'package:ziggy_test/controller/user-data.dart';
import 'package:ziggy_test/screens/home-screen.dart';

import '../model/new-user.dart';

class AddUser extends StatefulWidget {
  static const routeName = "/add-user-screen";
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  final TextEditingController _name = TextEditingController();
  final TextEditingController _job = TextEditingController();
  Future<NewUser>? _newUser;

  @override
  void dispose() {
    // TODO: implement dispose
    _name.dispose();
    _job.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.black,)),
            const Text(
              "Add User",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left : 5.0),
              child: Icon(Icons.person, color: Colors.black,),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/add-user.png"),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0, left: 8.0, right: 8.0),
              child: TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                  hintText: "Enter Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder()
                ),
                validator: (value){
                  if(value == null){
                    return "Cannot have empty name";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0, left: 8.0, right: 8.0),
              child: TextFormField(
                controller: _job,
                decoration: const InputDecoration(
                    hintText: "Enter Job",
                    prefixIcon: Icon(Icons.cases_outlined),
                    border: OutlineInputBorder()
                ),
                validator: (value){
                  if(value == null){
                    return "Cannot have empty name";
                  }
                  return null;
                },
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  if(_name.text.isNotEmpty && _job.text.isNotEmpty){
                    setState((){
                      _newUser = addUser(_name.text, _job.text);
                    });
                  }
                },
                child: const Text(
                  "Create User",
                  style: TextStyle(
                      color: Colors.black,
                    fontSize: 20
                  ),)
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              child: _newUser == null
                  ?  const ListTile(
                title: Text("No new user created yet"),
              )
                  : FutureBuilder(
                      future: _newUser,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          final n = snapshot.data;
                          return Column(
                            children: [
                              ListTile(
                                title: Text(n.name),
                                leading: const Icon(Icons.person),
                                trailing: Text(n.id),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(n.job),
                                    Text(n.createdAt)
                                  ],
                                ),
                              )
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return const Icon(Icons.error_outline);
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
            )
          ],
        ),
      ),
    );
  }
}
