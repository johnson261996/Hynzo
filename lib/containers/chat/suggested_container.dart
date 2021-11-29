///shows suggested users list according to user's interest

import 'package:flutter/material.dart';
import 'package:hynzo/widgets/userData/userData.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/resources/images.dart';

class SuggestedContainer extends StatefulWidget {
  @override
  _SuggestedContainerState createState() => _SuggestedContainerState();
}

class _SuggestedContainerState extends State<SuggestedContainer> {
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
              message: ''),
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
