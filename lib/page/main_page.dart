import 'package:flutter/material.dart';

import '../navigator/main_page_content_widget.dart';

///首页
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const MainPageContentWidget();
  }
}
