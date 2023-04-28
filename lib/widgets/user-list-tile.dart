import 'package:flutter/material.dart';

import '../model/user-model.dart';

class UserTile extends StatelessWidget {
  User u;
  UserTile({required this.u,  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(u.avatar),
      title: Row(
        children: [
          Text(u.firstName),
          Text(u.lastName)
        ],
      ),
      subtitle: Text(
          u.email,
        style: const TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
      ),
      trailing: Text(u.id.toString()),
    );
  }
}
