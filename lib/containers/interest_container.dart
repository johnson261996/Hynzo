import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hynzo/core/models/interest_model.dart';
import 'package:hynzo/providers/interest_provider.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:hynzo/utils/navigations.dart';
import 'package:hynzo/utils/toast_util.dart';
import 'package:hynzo/widgets/common/loading_overlay/loading_overlay.dart';
import 'package:hynzo/widgets/interest/interest_widget.dart';
import 'package:provider/provider.dart';

class InterestContainer extends StatefulWidget {
  const InterestContainer({Key? key}) : super(key: key);

  @override
  State<InterestContainer> createState() => _InterestContainerState();
}

class _InterestContainerState extends State<InterestContainer> {
  List<ResultsModel> allResults = [];
  bool _isLoading = false;
  bool _isNextPageIsEmpty = false;
  int _totalCount = 1;
  int limit = 10;
  static InterestProvider? _interestProvider;
  late InterestResponseModel interestResponseModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allResults.clear();
  }

  Future<void> getInitalInterestList(String limit, String offset) async {
    try {
      _interestProvider!.isLoading = true;
      interestResponseModel =
          await _interestProvider!.getInterestList(limit, offset);

      _interestProvider!.isLoading = false;
      if (interestResponseModel.statusCode == 200) {
        _totalCount = interestResponseModel.count!;
        for (var element in interestResponseModel.resultsList) {
          allResults.add(element);
        }
        if (interestResponseModel.next != '') {
          _isNextPageIsEmpty = false;
        } else {
          _isNextPageIsEmpty = true;
        }
      } else {
        ToastUtil().showToast("Something went wrong.");
      }
    } catch (e) {
      _interestProvider!.isLoading = false;
      ToastUtil().showToast(e.toString());
    }
  }

  Future<void> addInterests(String interestIds) async {
    try {
      _interestProvider!.isLoading = true;
      bool response = await _interestProvider!.createUserInterest(interestIds);
      _interestProvider!.isLoading = false;
      if (response) {
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          Navigation.pushReplacementNamed(context, Routes.location);
        } else {
          Navigation.pushReplacementNamed(context, Routes.suggetion);
        }


      } else {
        ToastUtil().showToast("Something went wrong.");
      }
    } catch (e) {
      _interestProvider!.isLoading = false;
      ToastUtil().showToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    _interestProvider = Provider.of<InterestProvider>(context, listen: false);
    return LoadingOverlay(
      isLoading: _interestProvider!.isLoading,
      color: AppColors.gray,
      child: InterestWidget(
        allResults: allResults,
        fetchInterest: getInitalInterestList,
        addInterest: addInterests,
        isNextValueEmpty: _isNextPageIsEmpty,
        totalCount: _totalCount,
      ),
    );
  }
}
