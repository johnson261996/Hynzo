/// Define all the strings to be used in application in this file
/// To use - import this file and call required string by:
///```dart
///      Strings.<name>
//```

class Strings {
  Strings._();

  // splash screen
  static const SPLASH_TEXT = '"HYPERLOCAL PRIVATE CHATTING"';
  static const TITLE_NAME = 'NGZO';

  // intro screen
  static const INTRO_TITLE = 'School Owner App';
  static const INTRO_LIST_TITLE = 'What’s in it for me?';
  static const INTRO_LIST = [
    'Monitor your school’s academic performance',
    'Manage your school’s social media accounts',
    'Track your school’s LEAD orders'
  ];
  static const SCHOOL_NEWS = 'School News';
  static const VIEW_ALL = 'View All';
  static const SOCIAL_MEDIA = 'SOCIAL MEDIA';
  static const MANAGE_SCHOOL = 'Manage school from your fingertips';
  static const MODE_SCHOOL = 'My school is running in ';
  static const MODE = ' mode.';

  //Common
  static const IS_NETWORK_CONNECTED = 'Please check your internet connection';
  static const GET_STARTED = 'Get Started';
  static const LOADING = 'loading...';

  //SignUp Screen
  static const HI_TEXT="Hi there!";
  static const LETS_STARTED="Let's Get Started";
  static const SIGN_UP_BUTTON="Create An Account";
  static const ALREADY_LOGIN="Already have an account ?";
  static const SIGNUP = 'Signup';

  //Login Screem
  static const ACCOUNT="Don't have an account ?";
  static const LOGIN = 'Login';
  static const LOGIN_SUBTITLE = 'Please, Log In.';
  static const LOGIN_TITLE = 'Welcome Back!';
  static const LOGIN_BUTTON = 'Continue >';
  static const LOGIN_TERMS =
      'By continuing, you accept the Terms and Condition';
  static const LOGIN_MOBILE_NOT_REGISTRED =
      'Sorry, this mobile number is not registered with us.';
  static const LOGIN_REACH_TEAM =
      ' Please reach out to your LEAD SPOC or contact customer support @ ';
  static const LOGIN_SUPPORT_MOBILE = '+91-8682833333';
  static const LOGIN_SUPPORT_EMAIL = 'product.support@leadschool.in';
  static const LOGIN_USER_NAME = 'Full name';
  static const LOGIN_USER_NUMBER = 'Mobile Number';

  // Validations
  static const PHONE_NUMBER_VALIDATION = 'Please enter a valid mobile number!';
  static const PHONE_EMPTY_VALIDATION = 'Mobile Number cannot be blank!';
  static const NAME_VALIDATION = 'Please enter a valid name!';
  static const NAME_EMPTY_VALIDATION = 'Name cannot be blank!';

  //Otp Screen
  static const OTP_TITLE = 'Enter OTP';
  static const OTP_SENT_NO = '4 digit OTP has been sent to ';
  static const OTP_BUTTON = 'Submit';
  static const OTP_RESEND = 'Resend OTP ';
  static const OTP_HEADING = 'We sent you an OTP';

  //Home
  static const HOME_SELECT = 'Select School';

  static const TITLE = 'Hello school owner,';
  static const DESCRIPTION =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s';
  static const GAMES = "Games";
  static const PROFILE_SETTINGS = "Profile & Settings";
  static const PROFILE = 'Profile';
  static const HOME = "Home";
  static const CHAT = "Chat";
  static const LOG_OUT = 'LogOut';

  //Onboarding

  static const ON_BOARDING = 'Onboarding';
  static const NEXT = 'Next';

  //tab_Bar
  static const Connected = 'Connected';
  static const Received = 'Received';
  static const Suggested = 'Suggested';

  //chat
  static const USER_NAMES = ['Anusree', 'John', 'Neha'];

  static const MESSAGES = ['Welcome', 'Welcome', 'Welcome'];
  static const SEARCH = 'Search New Connection';

  // it will return the dynamic string
  static String demo(amount) {
    return 'Total amount: $amount';
  }

  static String yourCategoryGenerates(String category) {
    return 'Your $category typically generates';
  }
}
