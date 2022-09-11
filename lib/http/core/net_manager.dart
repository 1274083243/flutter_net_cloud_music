

import '../request/base_request.dart';
import 'jsonparse/request_listener.dart';
import 'net_adapter.dart';

/// 网络请求管理类
class NetManager {
  NetManager._();

  static NetManager? _instance;
  late NetAdapter _adapter;

  /// 获取网络管理类
  static NetManager getInstance() {
    _instance ??= NetManager._();
    return _instance!;
  }

  setNetAdapter(NetAdapter adapter) {
    _adapter = adapter;
  }

  /// 发送请求
  void sendPostRequest<T>(BaseRequest request, {RequestListener<T>? listener}) {
    _adapter.sendPostRequest(request, listener: listener);
  }

  ///发送Get请求
  void sendGetRequest<T>(BaseRequest request, {RequestListener<T>? listener}) {
    _adapter.sendGetRequest(request, listener: listener);
  }
}
