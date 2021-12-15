import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:hynzo/themes/colors.dart';


class NoDataError extends StatefulWidget {
  const NoDataError({Key? key}) : super(key: key);

  @override
  State<NoDataError> createState() => _NoDataError();

}

class _NoDataError extends State<NoDataError> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var mediaQuery = MediaQuery.of(context).size;
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.grey[300],
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );

    //check the internet connection
    Future<bool> check() async {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        return true;
      }
      return false;
    }

    return Container(
        color: AppColors.white,
        width: mediaQuery.width,
        height: mediaQuery.height,
        child:   Column(
         mainAxisSize: MainAxisSize.min,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[

          Image.asset(
          "assets/images/error_503.jpg",
          height: 150,
          width: 150,
          ),

          Text('somethig went wrong'),

          ElevatedButton(
          style: raisedButtonStyle,
            onPressed: () {
             check().then((intenet) {
               if (intenet != null && intenet) {
               // Internet Present Case
               Navigator.pop(context);
               } else{
              // No-Internet Case
               }
             });
           },
          child: Text('Retry'),
        )
        ]),
      );
    }


}








