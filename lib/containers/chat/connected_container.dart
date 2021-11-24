///Shows connected users for the user

import 'package:flutter/material.dart';
import 'package:hynzo/widgets/userData/userData.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/resources/images.dart';

class ConnectedContainer extends StatefulWidget {
  @override
  _ConnectedContainerState createState() => _ConnectedContainerState();
}

class _ConnectedContainerState extends State<ConnectedContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView.separated(
          itemCount: 3,
          itemBuilder: (contex, index) => UserData(
              name: Strings.USER_NAMES[index],
              userImage: Images.UsersImages[index],
              message: Strings.MESSAGES[index]),
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 15,
            );
          },
        ),
      ),
    );
  }
}
