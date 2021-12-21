import 'package:flutter/material.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/widgets/common/profile_image/profile_image.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  String fullName = '';
  String userName = '';
  String avatar = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    String _fullName = (await LocalStorage.getUserFullName())!;
    String _userName = (await LocalStorage.getUserName())!;
    String _avatar = (await LocalStorage.getProfilePic())!;
    setState(() {
      fullName = _fullName;
      userName = _userName;
      avatar = _avatar;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.white,
      width: size.width,
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/top_back.png',
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
                          color: AppColors.greyBlack,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              )),
          Container(
              decoration: BoxDecoration(
                color: AppColors.blueDark,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1, 1),
                    blurRadius: 3,
                  )
                ],
              ),
              height: 142,
              margin: EdgeInsets.only(left: 17, right: 17, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15),
                    child: ProfileImageWidget(
                      backgroundcolor: AppColors.white,
                      valueColor: AppColors.white,
                      imageUrl: avatar,
                      level: 1,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(fullName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700)),
                         IconButton(
                                onPressed: null,
                                icon: Icon(
                                  Icons.edit_outlined,
                                  color: AppColors.white,
                                ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text('@$userName',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: AppColors.grayLight_secondary,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13)),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(children: [
                              Text(
                                '25',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: AppColors.white),
                              ),
                              Text('Friends',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          color: AppColors.white, fontSize: 9))
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30, top: 8),
                            child: Column(children: [
                              Text(
                                '230',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: AppColors.white),
                              ),
                              Text('Followers',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          color: AppColors.white, fontSize: 9))
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(children: [
                              Text(
                                '250',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: AppColors.white),
                              ),
                              Text('Following',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                          color: AppColors.white, fontSize: 9))
                            ]),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Expanded(child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: null,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                    ),
                    height: 70.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Profile.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'My Account',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.offgrey,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                          color: AppColors.graylight,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: AppColors.lightergray,
                  height: 2.0,
                ),
                InkWell(
                  onTap: null,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                    ),
                    height: 70.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Group.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'My Chat ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.offgrey,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                          color: AppColors.graylight,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: AppColors.lightergray,
                  height: 2.0,
                ),
                InkWell(
                  onTap: null,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                    ),
                    height: 70.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Group 12559.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Activities',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.offgrey,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                          color: AppColors.graylight,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: AppColors.lightergray,
                  height: 2.0,
                ),
                InkWell(
                  onTap: null,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                    ),
                    height: 70.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Notification.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Help & Support',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.offgrey,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                          color: AppColors.graylight,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: AppColors.lightergray,
                  height: 2.0,
                ),
                InkWell(
                  onTap: null,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                    ),
                    height: 70.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Vector.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Refer a friend',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.offgrey,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                          color: AppColors.graylight,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: AppColors.lightergray,
                  height: 2.0,
                ),
                InkWell(
                  onTap: (){
                    LocalStorage.clearToken();
                    Navigator.pushReplacementNamed(context, Routes.login);
                },
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                    ),
                    height: 70.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Logout.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Log out',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.offgrey,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                          color: AppColors.graylight,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ))

        ],
      ),
    );
  }
}
