import 'package:flutter/material.dart';
import 'package:hynzo/core/models/user_profile_model.dart';
import 'package:hynzo/resources/images.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/widgets/common/profile_image/profile_image.dart';


class MoreWidget extends StatefulWidget {
  final String imageUrl;
  final int level;
  // final UserProfileModel userDetails;
  final Function getUserDetails;

  const MoreWidget({
    Key? key,
    required this.imageUrl,
    required this.level,
    required this.getUserDetails
  }) : super(key: key);

  @override
  State<MoreWidget> createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  late String url = '';
  String name = '';
  UserProfileModel userDetails = UserProfileModel();

  @override
  void initState() {
    getUserDatas();
    super.initState();

  }
  getUserDatas() async {
    UserProfileModel response = await widget.getUserDetails();
    setState(() {
      name = response.full_name!;
      url = response.avatar!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Row(
              children: [
                Text(
                  Strings.Menu,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: AppColors.greyBlack,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 20,
                    color: AppColors.offBlack,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            child: Expanded(
              child: Row(
                children: [
                  ProfileImageWidget(
                    backgroundcolor: AppColors.offyellow,
                    valueColor: AppColors.darkyellow,
                    imageUrl: url,
                    level: 1,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.headline5!.apply(
                                color: AppColors.greyBlack,
                              ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        InkWell(
                          onTap: () async{
                            int? id  = await LocalStorage.getUserID();
                            Navigator.pushNamed(context, Routes.profile,arguments: {'id':id,'logged':true}).then((value) {
                              getUserDatas();
                              setState(() {
                              });
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                Strings.VIEW_PROFILE,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      fontSize: 14,
                                      color: AppColors.greyBlack,
                                    ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.news);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                        ),
                        height: 70.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.NEWS,
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              Strings.NEWS,
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
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                        ),
                        height: 70.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.SUBSCRIPTIONS,
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              Strings.SUBSCRIPTION,
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
                      onTap: () {
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                        ),
                        height: 70.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.WALLET,
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              Strings.WALLET,
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
                      onTap:null,
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                        ),
                        height: 70.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.SETTINGS,
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              Strings.SEETINGS,
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
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                        ),
                        height: 70.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.ABOUT,
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              Strings.ABOUT_US,
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
                      color: AppColors.offgrey,
                      height: 1.0,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                        ),
                        height: 70.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.HELP_IMAGE,
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              Strings.HELP_SUPPORT,
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
              ),
            ),
          )
        ],
      ),
    );
  }
}