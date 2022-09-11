import 'package:dio/dio.dart';

/// 登录的逻辑层
class LoginDao {
  ///登录
  login(String pwd, String userName) async {
    // LoginRequest request = LoginRequest();
    // request.addParam("username", userName);
    // request.addParam("password", pwd);
    // return await NetManager.getInstance().sendPostRequest(request);
    var result = await Dio().post(
      "https://www.wanandroid.com/user/login?username=ike&password=lwg123456",
    );
    return result.data;
  }
}
