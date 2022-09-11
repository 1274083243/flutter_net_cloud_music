
import '../model/net_response.dart';

/// 网络数据返回对象的数据解析类
abstract class HttpDataParser<T> {
  /// 解析原始数据
  Future<NetResponse<R>> parse<R>(T response);

  /// 包装响应数据
  R convert<R>(dynamic json);
}
