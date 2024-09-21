import 'dart:convert';

import 'package:male_app/core/database/cach/cach_helper.dart';
import 'package:male_app/core/errors/exceptions.dart';
import 'package:male_app/features/user/data/models/user_model.dart';

class UserCachedDataSource {
  final CacheHelper cacheHelper;
  final String key = "cachedUser";
  UserCachedDataSource({required this.cacheHelper});

  cacheUser(UserModel? userModel) {
    if (userModel != null) {
      cacheHelper.saveData(key: key, value: jsonEncode(userModel.toJson()));
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<UserModel> getLastUser() {
    final String? user = cacheHelper.getDataString(key: key);
    if (user != null) {
      return Future.value(UserModel.fromJson(json: jsonDecode(user)));
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}
