import 'package:flutter/material.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/utils.dart';

class CovidStateCard extends StatelessWidget {
  final String name;
  final int totalConfirmed;
  final int deaths;
  final int discharged;

  const CovidStateCard({
    required this.name,
    required this.totalConfirmed,
    required this.deaths,
    required this.discharged,
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int? activeCase = (totalConfirmed - (deaths + discharged));
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightSliver,
            offset: const Offset(
              2.0,
              2.0,
            ),
            blurRadius: 5.0,
            spreadRadius: 0.1,
          ), //BoxShadow
          const BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Column(
          //       children: [
          //         Text(
          //           Strings.TOTAL,
          //           style: Theme.of(context).textTheme.subtitle2!.copyWith(
          //                 color: AppColors.primaryDark,
          //                 fontWeight: FontWeight.w700,
          //               ),
          //         ),
          //         Text(
          //           Utils.NumberFormater(totalConfirmed),
          //           style: Theme.of(context).textTheme.subtitle2!.copyWith(
          //                 color: AppColors.primaryDark,
          //                 fontWeight: FontWeight.w700,
          //               ),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         Text(
          //           Strings.RECOVERED,
          //           style: Theme.of(context).textTheme.subtitle2!.copyWith(
          //                 color: AppColors.success,
          //                 fontWeight: FontWeight.w700,
          //               ),
          //         ),
          //         Text(
          //           Utils.NumberFormater(discharged),
          //           style: Theme.of(context).textTheme.subtitle2!.copyWith(
          //                 color: AppColors.success,
          //                 fontWeight: FontWeight.w700,
          //               ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 15,
          // ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    Strings.TOTAL,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    Utils.NumberFormater(totalConfirmed),
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    Strings.RECOVERED,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: AppColors.success,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    Utils.NumberFormater(discharged),
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: AppColors.success,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    Strings.DEATHS,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: AppColors.whitegrey,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    Utils.NumberFormater(deaths),
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: AppColors.whitegrey,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    Strings.ACTIVE,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: AppColors.red,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  Text(
                    Utils.NumberFormater(activeCase),
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: AppColors.red,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
