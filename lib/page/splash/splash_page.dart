import 'package:flutter/material.dart';
import 'package:flutter_net_cloud_music/base/widget/base_page_stateful.dart';
import 'package:flutter_net_cloud_music/base/base_state.dart';
import 'package:flutter_net_cloud_music/page/splash/splash_view_model.dart';
import 'package:flutter_net_cloud_music/page/splash/time_count_down_widget.dart';

class SplashPage extends BasePageStateful {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage, SplashViewModel> {
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Image.asset(
        "images/bgs/bg_splash.png",
        fit: BoxFit.fill,
      ),
      Positioned(
        right: 10,
        top: MediaQuery.of(context).padding.top,
        child: GestureDetector(
            onTap: () {
              print("点击了");
            },
            child: const TimeCountDownWidget()),
      )
    ]);
  }
}
