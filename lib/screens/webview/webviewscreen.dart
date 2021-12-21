import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hynzo/themes/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.white,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                })),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: data["link"],
          zoomEnabled: true,
          allowsInlineMediaPlayback: true,
          navigationDelegate: (NavigationRequest request) {
            return data["link"];
          },
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}
