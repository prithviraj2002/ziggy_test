import 'package:flutter/material.dart';

import '../model/new-user.dart';

class NewUserDialog extends StatelessWidget {
  NewUser n;
  NewUserDialog({required this.n, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.cancel))
            ],
          ),
          Text(n.name),
          Text(n.job),
          Text(n.id.toString()),
          Text(n.createdAt)
        ],
      ),
    );
  }
}
