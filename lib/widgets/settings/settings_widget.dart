import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hynzo/core/models/settings_model.dart';
import 'package:hynzo/core/models/user_profile_model.dart';
import 'package:hynzo/resources/images.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/widgets/common/profile_image/profile_image.dart';

class SettingsWidget extends StatefulWidget {
  final String imageUrl;
  final int level;
  final UserProfileModel userDetails;
  final Function settingsDetails;
  final Function setDetails;

  const SettingsWidget({
    Key? key,
    required this.imageUrl,
    required this.level,
    required this.userDetails,
    required this.settingsDetails,
    required this.setDetails,
  }) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late String url = '';
  String name = '';
  bool? nightMode = false;
  bool? ghostMode = false;
  bool? onlineMode = false;
  bool? muteMode = false;
  bool? msgReadMode = false;
  late SettingsModel settingsModel;

  getData() async {
    final response = await widget.settingsDetails();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        settingsModel = response;
      });
      setState(() {
        nightMode = settingsModel.nightMode!;
        ghostMode = settingsModel.ghostMode!;
        onlineMode = settingsModel.onlineMode!;
        muteMode = settingsModel.muteMode!;
        msgReadMode = settingsModel.msgReadMode;
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    name = widget.userDetails.full_name ?? '';
    url = widget.userDetails.avatar ?? '';
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
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: AppColors.greyBlack,
                      ),
                    ),
                    Text(
                      Strings.SETTINGS,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: AppColors.greyBlack,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 28,
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
                          onTap: () {
                            Navigator.pushNamed(context, Routes.profile);
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
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      height: 70.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            Images.GHOST_MODE,
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            Strings.GHOST_MODE,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.offgrey,
                                    ),
                          ),
                          const Spacer(),
                          Transform.scale(
                            scale: 0.6,
                            child: CupertinoSwitch(
                                value: ghostMode!,
                                onChanged: (value) {
                                  setState(() {
                                    ghostMode = value;
                                  });
                                  widget.setDetails(nightMode, ghostMode,
                                      onlineMode, muteMode, msgReadMode);
                                },
                                activeColor: AppColors.blueDark,
                                trackColor: AppColors.lightergray),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.lightergray,
                      height: 2.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      height: 70.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            Images.NOTIFICATION,
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            Strings.NOTIFICATION,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.offgrey,
                                    ),
                          ),
                          const Spacer(),
                          Transform.scale(
                            scale: 0.6,
                            child: CupertinoSwitch(
                                value: onlineMode!,
                                onChanged: (value) {
                                  setState(() {
                                    onlineMode = value;
                                  });
                                  widget.setDetails(nightMode, ghostMode,
                                      onlineMode, muteMode, msgReadMode);
                                },
                                activeColor: AppColors.blueDark,
                                trackColor: AppColors.lightergray),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.lightergray,
                      height: 2.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      height: 70.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            Images.NIGHT_MODE,
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            Strings.NIGHT_MODE,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.offgrey,
                                    ),
                          ),
                          const Spacer(),
                          Transform.scale(
                            scale: 0.6,
                            child: CupertinoSwitch(
                                value: nightMode!,
                                onChanged: (value) {
                                  setState(() {
                                    nightMode = value;
                                  });
                                  widget.setDetails(nightMode, ghostMode,
                                      onlineMode, muteMode, msgReadMode);
                                },
                                activeColor: AppColors.blueDark,
                                trackColor: AppColors.lightergray),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.lightergray,
                      height: 2.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      height: 70.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            Images.READ_RECIEPTS,
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            Strings.READ_RECIEPTS,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.offgrey,
                                    ),
                          ),
                          const Spacer(),
                          Transform.scale(
                            scale: 0.6,
                            child: CupertinoSwitch(
                                value: msgReadMode!,
                                onChanged: (value) {
                                  setState(() {
                                    msgReadMode = value;
                                  });
                                  widget.setDetails(nightMode, ghostMode,
                                      onlineMode, muteMode, msgReadMode);
                                },
                                activeColor: AppColors.blueDark,
                                trackColor: AppColors.lightergray),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.lightergray,
                      height: 2.0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      height: 70.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            Images.LAST_SEEN,
                            width: 25,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            Strings.LAST_SEEN,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.offgrey,
                                    ),
                          ),
                          const Spacer(),
                          Transform.scale(
                            scale: 0.6,
                            child: CupertinoSwitch(
                                value: muteMode!,
                                onChanged: (value) {
                                  setState(() {
                                    muteMode = value;
                                  });
                                  widget.setDetails(nightMode, ghostMode,
                                      onlineMode, muteMode, msgReadMode);
                                },
                                activeColor: AppColors.blueDark,
                                trackColor: AppColors.lightergray),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.offgrey,
                      height: 1.0,
                    ),
                    // InkWell(
                    //   onTap: () {},
                    //   child: Container(
                    //     padding: const EdgeInsets.only(
                    //       left: 15.0,
                    //       right: 15.0,
                    //     ),
                    //     height: 70.0,
                    //     child: Row(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         Image.asset(
                    //           Images.PRIVACY_SETTINGS,
                    //           width: 25,
                    //           height: 25,
                    //         ),
                    //         const SizedBox(
                    //           width: 20.0,
                    //         ),
                    //         Text(
                    //           Strings.PRIVACY_SETTINGS,
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .bodyText1!
                    //               .copyWith(
                    //                 fontWeight: FontWeight.w400,
                    //                 color: AppColors.offgrey,
                    //               ),
                    //         ),
                    //         const Spacer(),
                    //         Icon(
                    //           Icons.arrow_forward_ios_outlined,
                    //           size: 18,
                    //           color: AppColors.graylight,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    //  Divider(
                    //   color: AppColors.offgrey,
                    //   height: 1.0,
                    // ),
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
                              Images.STORAGE_DATA,
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              Strings.STORAGE_DATA,
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
                            SizedBox(width: 12),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: AppColors.offgrey,
                      height: 1.0,
                    ),
                    // InkWell(
                    //   onTap: () {},
                    //   child: Container(
                    //     padding: const EdgeInsets.only(
                    //       left: 15.0,
                    //       right: 15.0,
                    //     ),
                    //     height: 70.0,
                    //     child: Row(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         Image.asset(
                    //           Images.LANGUAGES,
                    //           width: 25,
                    //           height: 25,
                    //         ),
                    //         const SizedBox(
                    //           width: 20.0,
                    //         ),
                    //         Text(
                    //           Strings.LANGUAGES,
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .bodyText1!
                    //               .copyWith(
                    //                 fontWeight: FontWeight.w400,
                    //                 color: AppColors.offgrey,
                    //               ),
                    //         ),
                    //         const Spacer(),
                    //         Icon(
                    //           Icons.arrow_forward_ios_outlined,
                    //           size: 18,
                    //           color: AppColors.graylight,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    //   Divider(
                    //   color: AppColors.offgrey,
                    //   height: 1.0,
                    // ),
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
