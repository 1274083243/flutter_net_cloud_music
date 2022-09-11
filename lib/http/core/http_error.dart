/// 网络请求错误的封装类
class HttpError implements Exception {
  final Exception exception;

  HttpError(this.exception);
}
