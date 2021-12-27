import 'package:firebase_analytics/firebase_analytics.dart';

class FireAnalytics {
  static final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  void log(String name, String event) async {
    await analytics.logEvent(name: name, parameters: {
      'event': event,
    });
  }
}
