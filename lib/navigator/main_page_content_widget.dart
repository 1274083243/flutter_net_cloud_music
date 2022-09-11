import 'package:flutter/material.dart';

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
  final List<Widget> _pages = [
    // HomePage(),
    // ProjectPage(),
    // OfficialAccountsPage(),
    // SystemPage(),
    // MinePage()
  ];
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
          _bottomItem('首页', Icons.home),
          _bottomItem('项目', Icons.menu),
          _bottomItem('公众号', Icons.public),
          _bottomItem('系统', Icons.settings),
          _bottomItem('我的', Icons.people),
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
