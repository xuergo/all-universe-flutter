import 'package:all_universe_flutter/model/user.dart';
import 'package:all_universe_flutter/utils/utils.dart';

/// 用户
class UserAPI {
  /// 登录
  static Future<User> login({
    required Map params,
  }) async {
    var response = await Request().post(
      '/login',
      params: params,
    );
    return User.fromJson(response.data);
  }
}
