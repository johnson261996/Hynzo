import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hynzo/core/models/create_channel_model.dart';
import 'package:hynzo/core/models/suggestion_model.dart';
import 'package:hynzo/resources/strings.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localstorage.dart';

class SuggestedWidget extends StatefulWidget {
  final Function? getSuggestedList;
  final Function? addUser;

  const SuggestedWidget(
      {Key? key, required this.getSuggestedList, required this.addUser})
      : super(key: key);

  @override
  State<SuggestedWidget> createState() => _SuggestedWidgetState();
}

class _SuggestedWidgetState extends State<SuggestedWidget> {
  late SuggestionModel suggestionModel = SuggestionModel(resultsList: []);
  bool loading = true;

  @override
  void initState() {
    getSuggestedList();
    super.initState();
  }

  getSuggestedList() async {
    final SuggestionModel response = await widget.getSuggestedList!();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        suggestionModel = response;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
      child: suggestionModel.resultsList.isEmpty || loading
          ? Center(
              child: loading
                  ? CircularProgressIndicator(
                      color: AppColors.blueDark,
                    )
                  : const Text('No chats available'),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(
                right: 5.0,
                left: 5.0,
                bottom: 80.0,
              ),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  dense: false,
                  visualDensity: VisualDensity.standard,
                  leading: suggestionModel.resultsList[index].avatar != ''
                      ? CircleAvatar(
                          radius: 22.5,
                          backgroundImage: NetworkImage(
                              suggestionModel.resultsList[index].avatar!))
                      : Image.asset(
                          'assets/images/user.png',
                          fit: BoxFit.contain,
                          width: 45,
                          height: 45,
                        ),
                  title: Text(
                    suggestionModel.resultsList[index].full_name!,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  trailing: suggestionModel.resultsList[index].isSelected!
                      ? ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.white,
                            minimumSize: const Size(90.0, 40.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: AppColors.blueDark),
                            ),
                          ),
                          child: Text(
                            Strings.ADDED,
                            style: Theme.of(context).textTheme.button!.copyWith(
                                color: AppColors.blueDark,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            EasyLoading.show(
                                maskType: EasyLoadingMaskType.black);
                            int? uid = await LocalStorage.getUserID();
                            CreateChannelModel response = await widget.addUser!(
                                [
                                  '$uid',
                                  '${suggestionModel.resultsList[index].pk}'
                                ],
                                false);
                            EasyLoading.dismiss(animation: false);
                            if (response.participants.isNotEmpty) {
                              getSuggestedList();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.blueDark,
                            minimumSize: const Size(70.0, 30.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            Strings.ADD,
                            style: Theme.of(context).textTheme.button!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                );
              },
              itemCount: suggestionModel.resultsList.length,
            ),
    );
  }
}
