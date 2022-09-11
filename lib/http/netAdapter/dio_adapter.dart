import 'package:dio/dio.dart';


import '../core/http_data_parser.dart';
import '../core/jsonparse/request_listener.dart';
import '../core/net_adapter.dart';
import '../request/base_request.dart';
import 'dio_http_data_parser.dart';

///dio的网络请求库
class DioAdapter implements NetAdapter {
  @override
  void sendPostRequest<T>(BaseRequest request,
      {HttpDataParser? dataParser, RequestListener<T>? listener}) async {
    try {
      var response = await Dio().get(request.url(),
          queryParameters: request.getRequestData(),
          cancelToken: CancelToken());
      dataParser ??= DioHttpDataParser();
      listener?.successCallBack?.call(await dataParser.parse<T>(response));
    } on Exception catch (e) {
      listener?.failCallBack?.call(handleHttpError(e));
    }
  }

  @override
  void sendGetRequest<T>(BaseRequest request,
      {HttpDataParser? dataParser, RequestListener<T>? listener}) async {
    try {
      var response = await Dio().get(request.url(),
          queryParameters: request.getRequestData(),
          cancelToken: CancelToken());
      dataParser ??= DioHttpDataParser();
      var netResponse = await dataParser.parse<T>(response);
      listener?.successCallBack?.call(netResponse.data as T);
    } on Exception catch (e) {
      listener?.failCallBack?.call(handleHttpError(e));
    }
  }
}
