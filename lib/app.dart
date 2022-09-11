import 'package:flutter/material.dart';
import 'package:flutter_net_cloud_music/navigator/navigator.dart';
import 'package:flutter_net_cloud_music/navigator/router/my_router_delegate.dart';

class CloudMusicApp extends StatefulWidget {
  const CloudMusicApp({Key? key}) : super(key: key);

  @override
  State<CloudMusicApp> createState() => _CloudMusicAppState();
}

class _CloudMusicAppState extends State<CloudMusicApp> {
  final MyRouterDelegate routerDelegate = MyRouterDelegate();
  @override
  Widget build(BuildContext context) {
    NavigatorManager.getInstance().initDelegate(routerDelegate);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Router(
        routerDelegate: routerDelegate,
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}
