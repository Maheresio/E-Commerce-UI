abstract class AppStrings {
  //Auth Strings
  static const String login = 'Login';
  static const String signup = 'Sign up';
  static const String signOut = 'Sign Out';
  static const String myProfile = 'My profile';

  static const String enterYourName = 'Enter Your Name';
  static const String name = 'Name';

  static const String enterYourEmail = 'Enter your email';
  static const String email = 'Email';

  static const String enterYourPassword = 'Enter your password';
  static const String password = 'Password';

  static const String forgotPassword = 'Forgot your password?';
  static const String dontHaveAccount = 'Don\'t have an account? Register';
  static const String haveAccount = 'Already have an account?';

  static const String loginWithSocialAccount = 'Or login with social account';
  static const String signupWithSocialAccount =
      'Or sign up with social account';

  //firebase paths
  static const kProductsCollection = 'products/';

  //Home View Strings
  static const String kSaleTitle = 'Sale';
  static const String kNewTitle = 'New';
  static const String kSaleSubtitle = 'Super summer sale';
  static const String kNewSubtitle = 'You’ve never seen it before!';

  //drop down form field button

  static const kDropDownInitialSize = 'Size';
  static const kDropDownInitialColor = 'Color';

  static const List<String> kItemSizeList = ['XS', 'S', 'M', 'L', 'XL'];
  static const List<String> kItemColorList = [
    'Black',
    'Red',
    'White',
    'Grey',
    'Blue'
  ];

  // profile view
 static const List<String> kProfileTitle = [
    'My orders',
    'Shipping addresses',
    'Payment methods',
    'Promocodes',
    'My reviews',
    'Settings',
  ];
 static const List<String> kProfileSubtitle = [
    'Already have 12 orders',
    '3 ddresses',
    'Visa  **34',
    'You have special promocodes',
    'Reviews for 4 items',
    'Notifications, password',
  ];
}
