///contains basic datas of the users connected,received and suggested


import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  final String name;
  final String userImage;
  final String message;

  const UserData({
    required this.name,
    required this.userImage,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(userImage),
            radius: 30,
          ),
          Padding(padding: EdgeInsets.only(right: 10)),
          Center(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 12)),
                Text(name, style: Theme.of(context).textTheme.headline5),
                Text(message)
              ],
            ),
          )
        ],
      ),
    );
  }
}
