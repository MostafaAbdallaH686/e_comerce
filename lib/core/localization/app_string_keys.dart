import 'dart:ui';

import 'package:ntigradproject/core/cache_helper/cache_helper_keys.dart';

abstract class AppStringKeys {
  static const Locale localeEN = Locale(CacheHelperKeys.keyEN);
  static const Locale localeAR = Locale(CacheHelperKeys.keyAR);

  static const String login = 'login';
  static const String register = 'Register';
  static const String getstartedfisrst = 'You want\nAuthentic, here \nyou go!';
  static const String getstartedsecond = 'Find it here, buy it now!';
  static const String createaccount = 'Create an\naccount';
  static const String welcome = 'Welcome\nBack!';
  static const String registerHaveAreayAccount = 'By clicking the';
  static const String registerHaveAccount = 'Register';
  static const String registerHaveAreayAccountafter = 'button, you agree';
  static const String registerHaveAreayAccountafter2 = 'to the public offer';
  static const String myOrders = 'My Orders';
  static const String active = ' active';
  static const String completed = 'Completed';
  static const String cancelled = 'Cancelled';
  static const String noordertext1 =
      ' You dont have any \nactive orders at this\n               time';
}
