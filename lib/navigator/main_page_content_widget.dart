import 'package:flutter/material.dart';
import 'package:flutter_net_cloud_music/page/discover/discover_page.dart';
import 'package:flutter_net_cloud_music/page/event/event_page.dart';
import 'package:flutter_net_cloud_music/page/my/my_page.dart';

import '../utils/log_utils.dart';

/// 底部导航栏控件
class MainPageContentWidget extends StatefulWidget {
  const MainPageContentWidget({Key? key}) : super(key: key);

  @override
  State<MainPageContentWidget> createState() => _MainPageContentWidgetState();
}

class _MainPageContentWidgetState extends State<MainPageContentWidget> {
  final PageController _controller = PageController();
  final _defaultColor = Colors.grey;
  final _selectColor = Colors.blue;
  final List<Widget> _pages = [DisCoverPage(), EventPage(), MyPage()];
  var _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: _pages,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          LogUtils.e("页面变化了$index");
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        selectedItemColor: Colors.blue,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _controller.jumpToPage(index);
          _currentPageIndex = index;
          setState(() {});
          LogUtils.e("点击了$index");
        },
        items: [
          _bottomItem('发现', Icons.home),
          _bottomItem('我的', Icons.menu),
          _bottomItem('动态', Icons.public),
        ],
      ),
    );
  }

  /// 创建底部的Item
  _bottomItem(String label, IconData iconData) {
    return BottomNavigationBarItem(
      icon: Icon(iconData, color: _defaultColor),
      activeIcon: Icon(iconData, color: _selectColor),
      label: label,
    );
  }
}
