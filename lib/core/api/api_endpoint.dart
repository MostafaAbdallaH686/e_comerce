abstract class ApiEndpoint {
  static const String register = "register";
  static const String login = "login";
  static const String tasks = "/tasks";
  static const String mytasks = "/my_tasks";
  static const String newTasks = "/new_task";
  static const String refreshtoken = "refresh_token";
  static const String changePassword = "/change_password";
  static const String updateprofile = "update_profile";
  static const String getuserdata = "get_user_data";
}

abstract class ApiBaseUrl {
  static const String baseUrl =
      "https://nti-ecommerce-api-production.up.railway.app/api/";
}
