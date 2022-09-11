
import 'http_method.dart';

///网络请求基类
abstract class BaseRequest {
  /// 请求参数集合
  final _params = <String, dynamic>{};

  /// 请求头集合
  final _headers = <String, dynamic>{};

  /// 是否使用https
  var isUseHttps = true;

  /// 设置请求域名
  String authority() {
    return "www.wanandroid.com";
  }

  /// 数据接收超时时间
  int receiveTimeout() => 3000;

  /// 链接超时时间
  int connectTimeout() => 3000;

  /// 发送数据超时时间
  int sendTimeout() => 3000;

  /// 获取请求路径
  String url() {
    Uri uri;
    var pathString = path();
    if (isUseHttps) {
      uri = Uri.https(authority(), pathString);
    } else {
      uri = Uri.https(authority(), pathString);
    }
    return uri.toString();
  }

  /// 添加请求参数
  BaseRequest addParam(String key, dynamic value) {
    _params[key] = value;
    return this;
  }

  /// 添加请求头
  BaseRequest addHeader(String key, dynamic value) {
    _headers[key] = value;
    return this;
  }

  /////////////////抽象方法/////////////////
  /// 请求path
  String path();

  /// 设置网络请求方式
  HttpMethod httpMethod();

  Map<String, dynamic> getHeader() => _headers;

  Map<String, dynamic> getRequestData() => _params;
}
