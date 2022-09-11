///日志打印工具类
class LogUtils {
  static void e(String content, {String Tag = "flutter"}) {
    print("${Tag}:$content");
  }
}
