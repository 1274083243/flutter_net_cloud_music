/// 网络请求响应类
class NetResponse<T> {
  String msg = "";
  int? code = -1;
  T? data;

  NetResponse(this.msg, this.code, this.data);
}
