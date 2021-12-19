import 'dart:async' show Future;
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_http.dart';
import 'package:hynzo/core/services/auth/auth_interceptor.dart';
import 'package:hynzo/utils/connectivity.dart';
import 'package:hynzo/utils/toast_util.dart';

class ServiceBase {
  static String apiBaseUrl = 'http://api.hynzo.com/';

  static Future<http.Response> get({
    String? url,
    String? baseUrl = '',
    required Map<String, String> headers,
  }) async {
    checkConnectionStaus();
    String apiUrl = apiBaseUrl + url!;
    final response =
        await InterceptedHttp.build(interceptors: [AuthInterceptorHeader()])
            .get(Uri.parse(apiUrl), headers: headers);
    return response;
  }

  static Future<http.Response> post({
    String? url,
    required Map data,
    String baseUrl = '',
    required Map<String, String> headers,
  }) async {
    checkConnectionStaus();
    String apiUrl = apiBaseUrl + url!;
    final response =
        await InterceptedHttp.build(interceptors: [AuthInterceptorHeader()])
            .post(Uri.parse(apiUrl), body: jsonEncode(data), headers: headers);
    return response;
  }
}

checkConnectionStaus() {
  bool status = false;
  ConnectionStaus().check().then((connectionStatus) {
    if (connectionStatus) {
      status = true;
    } else {
      ToastUtil().showToast(
          "No internet connection available. Please check your connection or try again later.");
    }
  });
  return status;
}
