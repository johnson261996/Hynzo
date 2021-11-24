///shows connection requests received by user

import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/userData/userData.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/resources/images.dart';

class ReceivedContainer extends StatefulWidget {
  @override
  _ReceivedContainerState createState() => _ReceivedContainerState();
}

class _ReceivedContainerState extends State<ReceivedContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    fillColor: AppColors.primaryLight,
                    border: InputBorder.none,
                    hintText: Strings.SEARCH,
                    hintStyle: Theme.of(context).textTheme.bodyText1),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Expanded(
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
              )
            ],
          )),
    );
  }
}