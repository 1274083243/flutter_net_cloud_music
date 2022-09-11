/// 导航能力接口
abstract class NavigatorAbility {
  void push(String name, {dynamic args});
  void replace(String name, {dynamic args});
  void pop();
}
