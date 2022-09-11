import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_net_cloud_music/app.dart';
import 'package:flutter_net_cloud_music/page/error_page.dart';
import 'package:flutter_net_cloud_music/utils/log_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return ErrorPage("${details.exception}\n ${details.stack}", details);
    };
    runApp(const CloudMusicApp());
  }, (error, stack) {
    LogUtils.e("${error.toString()},$stack");
  });
}
