import '../http_error.dart';

/// 请求回调监听类
class RequestListener<T> {
  final SuccessCallBack? successCallBack;
  final FailCallBack? failCallBack;
  final LoadingCallBack? loadingCallBack;

  RequestListener(
      {this.successCallBack, this.failCallBack, this.loadingCallBack});
}

/// 请求成功的回调
typedef SuccessCallBack<T> = void Function(T data);

/// 请求失败的回调
typedef FailCallBack = void Function(HttpError error);

/// 加载中的回调
typedef LoadingCallBack = void Function();
