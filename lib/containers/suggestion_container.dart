import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hynzo/core/models/suggestion_model.dart';
import 'package:hynzo/providers/suggestion_provider.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/localstorage.dart';
import 'package:hynzo/utils/toast_util.dart';
import 'package:hynzo/widgets/common/loading_overlay/loading_overlay.dart';
import 'package:hynzo/widgets/suggetion/suggestion_widget.dart';

class SuggestionContainer extends StatefulWidget {
  const SuggestionContainer({Key? key}) : super(key: key);

  @override
  State<SuggestionContainer> createState() => _SuggestionContainerState();
}

class _SuggestionContainerState extends State<SuggestionContainer> {
  bool _isLoading = false;
  List<ResultsModel> allResults = [];
  int _totalCount = 1;
  late String userId;
  static SuggestionProvider? _suggestionProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _suggestionProvider =
        Provider.of<SuggestionProvider>(context, listen: false);
    allResults.clear();
    // ConnectionStaus().check().then((connectionStatus) {
    //   if (connectionStatus) {
    getSuggestionList();
    // } else {
    //   ToastUtil().showToast(
    //       "No internet connection available. Please check your connection or try again later.");
    // }
    // });
  }

  Future<void> getSuggestionList() async {
    try {
      setState(() {
        _isLoading = true;
      });
      SuggestionModel suggestionModel =
          await _suggestionProvider!.getSuggestionList();
      if (suggestionModel.statusCode == 200) {
        _totalCount = suggestionModel.count!;
        for (var element in suggestionModel.resultsList) {
          allResults.add(element);
        }
      } else {
        ToastUtil().showToast("Something went wrong.");
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ToastUtil().showToast(e.toString());
    }
  }

  Future<void> addSuggestUser(String suggestUserId, int index) async {
    List<String> userIds = [];
    userIds.clear();
    try {
      setState(() {
        _isLoading = true;
      });
      await LocalStorage.getUserID().then((value) => userId = value.toString());
      userIds.add(suggestUserId);
      userIds.add(userId);
      SuggestUserAddResponseModel suggestionModel =
          await _suggestionProvider!.addSuggestUser(userIds);
      if (suggestionModel.statusCode == 201) {
        allResults[index].isSelected = !allResults[index].isSelected!;
        ToastUtil().showToast("User added successfully.");
      } else {
        ToastUtil().showToast("Something went wrong.");
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ToastUtil().showToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      color: AppColors.gray,
      child: SuggestionWidget(
        totalCount: _totalCount,
        allResults: allResults,
        addUser: addSuggestUser,
      ),
    );
  }
}
