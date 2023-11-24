import 'dart:convert';

import 'package:ecommerceapp/ui/model/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? token;
  static UserModel? userModel;

  static Future<void> saveUserInformation(String t, UserModel model) async {
    // print("Name is ${userModel?.firstName}");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', t);
    await sharedPreferences.setString('user', jsonEncode(model.toJson()));

    token = t;
  }

  static Future<UserModel> initializeUserCache() async {
    UserModel? currenrUserInfo;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    String? userInfo = sharedPreferences.getString('user');
    if (userInfo != null) {
      currenrUserInfo = UserModel.fromJson(jsonDecode(userInfo));
    }

    return currenrUserInfo!;
  }

  static Future<bool> checkAuthState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey('token')) {
      await initializeUserCache();
      return true;
    }
    return false;
  }

  static Future<void> clearAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    token = null;
  }
}
