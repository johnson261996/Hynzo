import 'package:flutter/material.dart';
import 'package:invent_chat/resources/strings.dart';
import 'package:invent_chat/themes/colors.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({Key? key}) : super(key: key);

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
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .apply(color: AppColors.greyBlack),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 20,
                    color: AppColors.greyBlackTypeTwo,
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
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      child: Image.asset(
                        'assets/images/profile_image_background.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 4.0,
                      bottom: 4.0,
                      right: 4.0,
                      left: 4.0,
                      child: Container(
                        width: 65.0,
                        height: 65.0,
                        child: Image.asset(
                          'assets/images/profile_image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 45.0,
                      bottom: 5.0,
                      right: 5.0,
                      left: 45.0,
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        child: Image.asset(
                          'assets/images/profile_star.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50.0,
                      bottom: 5.0,
                      right: 5.0,
                      left: 52.0,
                      child: Text(
                        '2',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 9,
                              color: AppColors.yellowDark,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.DUMMY_PROFILE_NAME,
                      style: Theme.of(context).textTheme.caption!.apply(
                            color: AppColors.greyBlack,
                          ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(Strings.VIEW_PROFILE,
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        fontSize: 12,
                                        color: AppColors.greyBlack,
                                      )),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 12,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
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
                      child: GestureDetector(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/news.png',
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
                                color: AppColors.lightgrayTypeTwo,
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
                        onTap: () {},
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
                      child: GestureDetector(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/subscription.png',
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
                                color: AppColors.lightgrayTypeTwo,
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
                        onTap: () {},
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
                      child: GestureDetector(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/edit.png',
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              Strings.EDIT_HOME_SCREEN,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightgrayTypeTwo,
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
                        onTap: () {},
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
                      child: GestureDetector(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/wallet.png',
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
                                color: AppColors.lightgrayTypeTwo,
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
                        onTap: () {},
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
                      child: GestureDetector(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/settings.png',
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
                                color: AppColors.lightgrayTypeTwo,
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
                        onTap: () {},
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
                      child: GestureDetector(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/about.png',
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
                                color: AppColors.lightgrayTypeTwo,
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
                        onTap: () {},
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
                      child: GestureDetector(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/help.png',
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
                                    color: AppColors.lightgrayTypeTwo,
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
                        onTap: () {},
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
