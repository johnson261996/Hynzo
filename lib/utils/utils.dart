import 'package:intl/intl.dart';

class Utils {
  Utils._();

  // returns a error message when the field is empty or lenght is less than 3 characters
  static String NumberFormater(int number) {
    if (number != null) {
      var formatter = NumberFormat('#,##,000');
      return formatter.format(number);
    } else {
      return '-';
    }
  }
}
