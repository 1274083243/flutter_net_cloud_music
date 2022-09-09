import 'package:flutter/material.dart';
import 'package:flutter_net_cloud_music/base/base_state.dart';
import 'package:flutter_net_cloud_music/base/proxy_view_model.dart';
import 'package:flutter_net_cloud_music/base/widget/base_page_stateful.dart';

class EmptyViewModelStatefulPage extends BasePageStateful {
  const EmptyViewModelStatefulPage({Key? key}) : super(key: key);

  @override
  State<EmptyViewModelStatefulPage> createState() => _EmptyViewModelStatefulPageState();
}

class _EmptyViewModelStatefulPageState extends BaseState<EmptyViewModelStatefulPage,ProxyViewModel> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
