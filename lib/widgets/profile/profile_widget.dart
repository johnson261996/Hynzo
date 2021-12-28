///Profile page widget

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hynzo/core/models/create_channel_model.dart';
import 'package:hynzo/core/models/user_profile_model.dart';
import 'package:hynzo/resources/images.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/widgets/common/buttons/textButton.dart';
import 'package:hynzo/widgets/common/friendsCoinsContainer/friendsCoins_Container_widget.dart';
import 'package:hynzo/widgets/common/profile_image/profile_image.dart';

class ProfileWidget extends StatefulWidget {
  final Function getUserDetails;
  final Map args;
  final Function? addUser;

  const ProfileWidget(
      {Key? key, required this.getUserDetails, required this.args,required this.addUser})
      : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  String fullName = '';
  String userName = '';
  String avatar = '';
  String buttonText = '';
  UserProfileModel userDetails = UserProfileModel();

  @override
  void initState() {
    // TODO: implement initState
    getUserDatas();
    super.initState();
    buttonText = Strings.ADD_USER;
  }

  getUserDatas() async {
    UserProfileModel response = await widget.getUserDetails();
    setState(() {
      fullName = response.full_name!;
      avatar = response.avatar!;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle textStyle = Theme.of(context).textTheme.bodyText1!.copyWith(
        color: AppColors.grey_primary,
        fontSize: 14,
        fontWeight: FontWeight.w400);
    return Container(
      color: AppColors.white,
      width: size.width,
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(Images.PROFILE_BANNER),
                height: 250,
                width: size.width,
              ),
              Positioned(
                  top: 60,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          Images.TOP_BACK,
                          color: AppColors.white,
                          width: 15,
                          height: 15,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text(
                        Strings.PROFILE_HEADING,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      widget.args['logged'] == true ?
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.5,
                          ),
                          TextButton(
                              onPressed: () {
                                LocalStorage.clearToken();
                                Navigator.pushNamed(context, Routes.login);
                              },
                              child: Text(
                                Strings.LOG_OUT,
                                style:
                                Theme.of(context).textTheme.headline1!.copyWith(
                                  color: AppColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ))
                        ],
                      ): SizedBox(
                        width: size.width * 0.02,
                      ),
                    ],
                  )),
              Positioned(
                  top: 160,
                  right: size.width / 2 - 35,
                  child: ProfileImageWidget(
                    imageUrl: avatar,
                    backgroundcolor: AppColors.white,
                    valueColor: AppColors.white,
                    level: 2,
                  ))
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Center(
                    child: Text(
                  fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: AppColors.black, fontSize: 24),
                )),
                Center(
                  child: Text(
                    Strings.LOCATION,
                    style: textStyle,
                  ),
                )
              ],
            ),
          ),
          Row(children: [
            FriendsCoinsContainer(text: Strings.FRIENDS, number: Strings.FRIENDS_NUMBER),
            FriendsCoinsContainer(text: Strings.COINS, number:Strings.COINS_NUMBER),
          ]),
          SizedBox(
            height: size.height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              Strings.ABOUT_HEADING,
              style: textStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.lightgray)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Strings.ABOUT,
                style: textStyle,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          widget.args['logged'] == true
              ? CustomTextButton(
                  fillColor: AppColors.blueDark,
                  borderColor: AppColors.blueDark,
                  text: Strings.EDIT_PROFILE,
                  style: Theme.of(context).textTheme.button!,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.edit_profile)
                        .then((value) {
                      getUserDatas();
                      setState(() {});
                    });
                  })
              : CustomTextButton(
                  fillColor: AppColors.blueDark,
                  borderColor: AppColors.blueDark,
                  text: buttonText,
                  style: Theme.of(context).textTheme.button!,
                  onPressed: () async {
                    EasyLoading.show(
                        maskType: EasyLoadingMaskType.black);
                    int? uid = await LocalStorage.getUserID();
                    CreateChannelModel response = await widget.addUser!(
                        [
                          '$uid',
                          '${widget.args['id']}'
                        ],
                        false);
                    EasyLoading.dismiss(animation: false);
                    if(response.participants.isNotEmpty){
                      setState(() {
                        buttonText = Strings.USER_ADDED;
                      });
                    }
                  })
        ],
      ),
    );
  }
}
