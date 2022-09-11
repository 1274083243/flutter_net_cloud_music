import 'package:flutter/material.dart';
import 'package:flutter_net_cloud_music/navigator/router/router_const.dart';
import 'package:flutter_net_cloud_music/navigator/router/router_info.dart';
import 'package:flutter_net_cloud_music/page/splash/splash_page.dart';

import '../../page/main_page.dart';
import '../../page/un_known_page.dart';
import '../../utils/log_utils.dart';

/// 路由代理对象
class MyRouterDelegate extends RouterDelegate<RouterInfo>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  List<Page> _pages = [MaterialPage(child: const SplashPage())];
  final GlobalKey<NavigatorState> myKey = GlobalKey();

  @override
  Widget build(Object context) {
    return Navigator(
      key: myKey,
      pages: _pages,
      onPopPage: _onPopPage,
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => myKey;

  @override
  Future<void> setNewRoutePath(RouterInfo configuration) async {}

  bool _canPop() {
    return _pages.length > 1;
  }

  bool _onPopPage(Route route, dynamic result) {
    LogUtils.e('_onPopPage执行');
    if (!route.didPop(result)) {
      return false;
    }
    if (!_canPop()) {
      return false;
    }
    _pages.removeLast();
    return true;
  }

  ///创建路由页面对象
  MaterialPage _createPage(RouteSettings settings) {
    Widget childPage;
    switch (settings.name) {
      case RouterPathConst.HOME_PATH:
        childPage = const MainPage();
        break;
      // case RouterPathConst.ARTICLE_DETAIL_PATH:
      //   childPage = const ArticleDetailPage();
      //   break;
      // case RouterPathConst.LOGIN_PATH:
      //   LogUtils.e('进入登陆页');
      //   childPage = const LoginPage();
      //   break;
      default:
        childPage = const UnKnowPage();
        break;
    }
    return MaterialPage(child: childPage, key: ValueKey(childPage.hashCode));
  }

  //////////公公方法
  ///推入一个页面
  void push(String pathName, {dynamic args}) {
    _pages = [..._pages];
    _pages.add(_createPage(RouteSettings(name: pathName, arguments: args)));
    notifyListeners();
  }

  /// 弹出顶部页面
  void popTop() {
    if (_pages.isEmpty) {
      return;
    }
    _pages = [..._pages];
    _pages.removeLast();
    notifyListeners();
  }

  void replace(String name, {required args}) {
    if (_pages.isEmpty) {
      return;
    }
    _pages.removeLast();
    _pages = [..._pages];
    _pages.add(_createPage(RouteSettings(name: name, arguments: args)));
    notifyListeners();
  }
}
