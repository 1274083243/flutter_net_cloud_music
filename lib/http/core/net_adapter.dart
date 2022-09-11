

import '../request/base_request.dart';
import 'http_data_parser.dart';
import 'http_error.dart';
import 'jsonparse/request_listener.dart';

///网络请求适配器，用于网络请求库切换
abstract class NetAdapter {
  ///发送Post请求
  void sendPostRequest<T>(BaseRequest request,
      {HttpDataParser? dataParser, RequestListener<T>? listener});

  ///发送Get请求
  void sendGetRequest<T>(BaseRequest request,
      {HttpDataParser? dataParser, RequestListener<T>? listener});
}

/// 处理错误请求码
HttpError handleHttpError(Exception exception) {
  return HttpError(exception);
}
