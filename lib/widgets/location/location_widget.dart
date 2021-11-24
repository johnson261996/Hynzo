import 'package:flutter/material.dart';
import 'package:invent_chat/resources/strings.dart';
import 'package:invent_chat/routes/routes.dart';
import 'package:invent_chat/themes/colors.dart';
import 'package:invent_chat/widgets/common/buttons/primary_button.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/location.png',
                  width: 250,
                  height: 250,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.02,
                ),
                Text(
                  Strings.LOCATION_Title,
                  style: Theme.of(context).textTheme.headline4!.copyWith(color: AppColors.gray,fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0,),
                  child: Text(
                    Strings.LOCATION_SUBTITLE,
                    style: Theme.of(context).textTheme.headline6!.copyWith(color: AppColors.lightergray,fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 20.0,
              ),
              child: PrimaryButton(
                text: const Text(Strings.LOCATION_BUTTON),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.suggetion);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
