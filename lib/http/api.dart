import 'package:all_univers/http/request.dart';

class Api {
  // 登录
  static login(data) {
    return Request.post(
      "/users/login",
      data: data,
    );
  }
}
