import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_net_cloud_music/page/splash/splash_page.dart';

class CloudMusicApp extends StatefulWidget {
  const CloudMusicApp({Key? key}) : super(key: key);

  @override
  State<CloudMusicApp> createState() => _CloudMusicAppState();
}

class _CloudMusicAppState extends State<CloudMusicApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
