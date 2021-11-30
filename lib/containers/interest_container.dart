import 'package:flutter/material.dart';
import 'package:hynzo/core/models/interest_model.dart';
import 'package:hynzo/providers/interest_provider.dart';
import 'package:hynzo/routes/routes.dart';
import 'package:hynzo/utils/localstorage.dart';
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
  int limit=10;
  static InterestProvider? _interestProvider;
  late InterestResponseModel interestResponseModel;
  late String token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _interestProvider = Provider.of<InterestProvider>(context,listen: false);
    allResults.clear();
    getInitalInterestList(limit.toString(), "0");
  }

  void getInitalInterestList(String limit,String offset) async {
    setState(() {
      _isLoading = true;
    });
    await LocalStorage.getLoginStatus().then((value) => token=value!);
    interestResponseModel = await _interestProvider!
        .getInterestList(limit, offset,token);
    if (interestResponseModel.statusCode == 200) {
      interestResponseModel.resultsList.forEach((element) {
        allResults.add(element);
      });
    } else {
      ToastUtil().showToast("Something went wrong.");
    }
    setState(() {
      _isLoading = false;
    });
  }

  void addInterests(String interestIds) async {
    setState(() {
      _isLoading = true;
    });
    LocalStorage.getLoginStatus().then((value) => token=value!);
    bool response = await _interestProvider!.createUserInterest(interestIds,token);
    if (response) {
      Navigator.pushReplacementNamed(context, Routes.location);
    } else {
      ToastUtil().showToast("Something went wrong.");
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      color: Colors.transparent,
      child: InterestWidget(
        allResults: allResults,
        fetchInterest: getInitalInterestList,
        addInterest: addInterests,
      ),
    );
  }
}
