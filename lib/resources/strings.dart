/// Define all the strings to be used in application in this file
/// To use - import this file and call required string by:
///```dart
///      Strings.<name>
//```

class Strings {
  Strings._();

  // splash screen
  static const SPLASH_TEXT = '"HYPERLOCAL PRIVATE CHATTING"';
  static const TITLE_NAME = 'HYNZO';

  // intro screen
  static const INTRO_TITLE = 'School Owner App';
  static const INTRO_LIST_TITLE = 'What’s in it for me?';
  static const INTRO_LIST = [
    'Monitor your school’s academic performance',
    'Manage your school’s social media accounts',
    'Track your school’s LEAD orders'
  ];
  static const SCHOOL_NEWS = 'School News';
  static const VIEW_ALL = 'View all';
  static const SOCIAL_MEDIA = 'SOCIAL MEDIA';
  static const MANAGE_SCHOOL = 'Manage school from your fingertips';
  static const MODE_SCHOOL = 'My school is running in ';
  static const MODE = ' mode.';

  //Common
  static const IS_NETWORK_CONNECTED = 'Please check your internet connection';
  static const GET_STARTED = 'Get Started';
  static const LOADING = 'loading...';

  //SignUp Screen
  static const HI_TEXT = "Hi there!";
  static const LETS_STARTED = "Let's Get Started";
  static const SIGN_UP_BUTTON = "Create An Account";
  static const ALREADY_LOGIN = "Already have an account ?";
  static const SIGNUP = 'Signup';

  //Login Screem
  static const ACCOUNT = "Don't have an account ?";
  static const LOGIN = 'Login';
  static const LOGIN_SUBTITLE = 'Let\'s get started.';
  static const LOGIN_TITLE = 'Hi  there!';
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
  static const OTP_HEADING = 'Verification Code';

  //INTRO
  static const CONNECT_FRIENDS = "Connect Friends";
  static const PLAY_GAMES = "Play Games";
  static const EXPLORE_LOCALITY = "Explore Locality";
  static const DUMMY_TEXT =
      "Lorem Ipsum dummy text is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's dummy text";

  //Interest
  static const INTEREST_TITLE = "What are \n your interests ?";

  //Suggetion
  static const SUGGESTION_TITLE = "Suggested people near you";
  static const ADD = "Add";
  static const ADDED = "Added";
  static const ACCEPT = "Accept";

  //Location
  static const LOCATION_Title = "Allow access to your location";
  static const LOCATION_SUBTITLE =
      "Your location will be used to show potential suggestions near you";
  static const LOCATION_BUTTON = "Ok, let's do it";

  //Home
  static const HOME_SELECT = 'Select School';

  static const TITLE = 'Hello school owner,';
  static const DESCRIPTION =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s';

  //Nav Bar
  static const GAMES = "Games";
  static const PROFILE_SETTINGS = "Profile & Settings";
  static const PROFILE = 'More';
  static const HOME = "Home";
  static const CHAT = "Messages";
  static const EVENTS = "Events";
  static const LOG_OUT = 'LogOut';

  //Home
  static const HOME_PROFILE_NAME = "Welcome Kumar,";
  static const HOME_PROFILE_SUBTITLE = "What would you like to play?";
  static const AMOUNT = "560";
  static const SPECIAL_EVENTS = "Special Events";
  static const MUST_TRY_GAMES = "Must Try Games";
  static const TODAY_NEWS = "Today's News";
  static const GAMES_BY_CATEGORIES = "Games by Categories";
  static const SEARCH_GAMES = "Search Games here";
  static const SEARCH_CHATS = "Search Chats here";
  static const SEARCH_EVENTS = "Search Events here";
  static const MORE_NEWS = "More news";
  static const ALL_GAMES_HOME = "All Games";

  //Events
  static const CATEGORIES_TITLE = "Categories";
  static const CATEGORIES_SUBTITLE = "Step out and exprience special events";
  static const KIDS = "Kids Zone";
  static const MUSIC = "Music";
  static const COMEDY = "Comedy";
  static const FIT = "Stay fit";

  //More
  static const Menu = "Menu";
  static const DUMMY_PROFILE_NAME = "Kumar KD";
  static const VIEW_PROFILE = "view profile";
  static const NEWS = "News";
  static const SUBSCRIPTION = "Subscription";
  static const EDIT_HOME_SCREEN = "Edit home screen";
  static const WALLET = "Wallet";
  static const SEETINGS = "Settings";
  static const ABOUT_US = "About us";
  static const HELP_SUPPORT = "Help & Support";

  static const WORKSHOPS = "Workshops";

  //Onboarding

  static const ON_BOARDING = 'Onboarding';
  static const NEXT = 'Next';

  //tab_Bar
  static const Connected = 'Connected';
  static const Received = 'Received';
  static const Suggested = 'Suggested';

  //game
  static const RECENTLY_PLAYED = "Recently Played";
  static const ALL_GAMES = "All games";
  static const SUGGESTED_GAMES = "Suggested for you";
  static const NEW = "New";
  static const POPULAR_GAMES = "Popular Games";

  //chat
  static const USER_NAMES = ['Anusree', 'John', 'Neha'];

  static const MESSAGES = ['Welcome', 'Welcome', 'Welcome'];
  static const SEARCH = 'Search New Connection';

  //Profile
  static const PROFILE_HEADING = 'Profile';
  static const LOGOUT = 'Log Out';
  static const REFER_FRIEND = 'Refer a friend';
  static const ACTIVITIES ='Activities';
  static const MY_CHAT = 'My Chat';
  static const MY_ACCOUNT = 'My Account';
  static const FOLLOWING = 'Following';
  static const FOLLOWING_NUMBER = '250';
  static const FOLLOWERS = 'Followers';
  static const FOLLLOWERS_NUMBER = '230';
  static const FRIENDS = 'Friends';
  static const FRIENDS_NUMBER = '25';

  // it will return the dynamic string
  static String demo(amount) {
    return 'Total amount: $amount';
  }

  static String yourCategoryGenerates(String category) {
    return 'Your $category typically generates';
  }
}
