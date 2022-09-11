import 'package:flutter/material.dart';
import 'package:flutter_net_cloud_music/base/base_state.dart';
import 'package:flutter_net_cloud_music/base/widget/base_page_stateful.dart';
import 'package:flutter_net_cloud_music/page/splash/splash_view_model.dart';
import 'package:flutter_net_cloud_music/page/splash/time_count_down_widget.dart';
import 'package:flutter_net_cloud_music/utils/log_utils.dart';

import '../../navigator/navigator.dart';
import '../../navigator/router/router_const.dart';
import '../../utils/hex_color.dart';

class SplashPage extends BasePageStateful {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage, SplashViewModel>
    with SingleTickerProviderStateMixin {
  bool showText = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        showText = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Container(
        alignment: Alignment.topCenter,
        color: HexColor("#DD2819"),
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Image.asset(
            "images/icon_logo.png",
            width: 70,
            height: 70,
          ),
        ),
      ),
      Positioned(
        right: 10,
        top: MediaQuery.of(context).padding.top,
        child: GestureDetector(onTap: () {
          goToHomePage();
        }, child: TimeCountDownWidget(
          timeEndCallback: () {
            goToHomePage();
          },
        )),
      ),
      Positioned(
        child: AnimatedOpacity(
          opacity: showText ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Text(
                "音乐的力量·网易云音乐",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}

goToHomePage() {
  LogUtils.e("goToHomePage");
  NavigatorManager.getInstance().replace(RouterPathConst.HOME_PATH);
}
