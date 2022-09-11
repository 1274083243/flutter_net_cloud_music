import 'package:flutter_net_cloud_music/navigator/router/my_router_delegate.dart';

import 'navigator_ability.dart';

/// 导航器
class NavigatorManager implements NavigatorAbility {
  static NavigatorManager? _instance;

  MyRouterDelegate? routeDelegate;
  NavigatorManager._();

  ///获区导航器对象
  static NavigatorManager getInstance() {
    return _instance ??= NavigatorManager._();
  }

  void initDelegate(MyRouterDelegate delegate) {
    routeDelegate = delegate;
  }

  @override
  void pop() {
    routeDelegate?.popTop();
  }

  @override
  void push(String name, {args}) {
    routeDelegate?.push(name, args: args);
  }

  @override
  void replace(String name, {args}) {
    routeDelegate?.replace(name, args: args);
  }
}
