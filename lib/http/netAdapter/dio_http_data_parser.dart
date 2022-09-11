import 'package:dio/dio.dart';

import '../core/http_data_parser.dart';
import '../model/home_banner_entity.dart';
import '../model/net_response.dart';

/// 专门为dio服务的数据解析对象
class DioHttpDataParser implements HttpDataParser<Response> {
  @override
  Future<NetResponse<R>> parse<R>(Response response) async {
    var result = NetResponse<R>(response.statusMessage ?? '请求成功',
        response.statusCode ?? -1, convert<R>(response.data['data']));
    return result;
  }

  @override
  R convert<R>(dynamic json) {
    if (<HomeBannerEntity>[] is R && json is List) {
      return json.map((e) => HomeBannerEntity.fromJson(e)).toList() as R;
    }
    throw UnsupportedError("该类型不支持转换:${R.toString()}");
  }
}
