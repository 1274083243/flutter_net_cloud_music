import 'package:flutter/material.dart';
import 'package:flutter_net_cloud_music/base/page/page_state.dart';
import 'package:flutter_net_cloud_music/base/view_model.dart';

abstract class BaseState<W extends StatefulWidget,VM extends ViewModel> extends State<W>{
  late ViewModel vm;
  PageState pageState = PageState.idle;
}