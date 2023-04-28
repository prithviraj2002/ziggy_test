import 'dart:async';
import 'dart:convert';

import 'package:ziggy_test/model/new-user.dart';

import '../model/user-model.dart';
import 'package:http/http.dart' as http;

Future<List<User>> getUsers() async{

  List<User> users = [];

  final response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

  final usersData = jsonDecode(response.body);
  final uData = usersData['data'];
  for(Map<String, dynamic> u in uData){
    users.add(User.fromJson(u));
  }

  return users;
}

Future<NewUser> addUser(String name, String job) async{
  //To Do: Add user using http post
  final response = await http.post(
      Uri.parse("https://reqres.in/api/users"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name' : name,
      'job' : job
    })
  );

  if(response.statusCode == 201){
    return NewUser.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("An error occurred");
  }

}