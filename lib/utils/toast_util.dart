import 'package:fluttertoast/fluttertoast.dart';
import 'package:hynzo/themes/colors.dart';

class ToastUtil{

  void showToast(String message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.gray,
      fontSize: 12,
      textColor: AppColors.white,
    );
  }
}