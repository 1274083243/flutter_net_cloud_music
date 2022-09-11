import 'package:flutter/material.dart';

class DisCoverPage extends StatefulWidget {
  const DisCoverPage({Key? key}) : super(key: key);

  @override
  State<DisCoverPage> createState() => _DisCoverPageState();
}

class _DisCoverPageState extends State<DisCoverPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("我是发现页面"),
    );
  }
}
