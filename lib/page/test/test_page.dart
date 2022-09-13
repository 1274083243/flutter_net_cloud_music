import 'package:flutter/material.dart';

import '../../utils/log_utils.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Center(
        child: Container(
          color: Colors.red,
          width: 20,
          height: 20,
          child: LayoutBuilder(
            builder: (context, constrait) {
              LogUtils.e("constrait:$constrait", Tag: "ike");
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                RenderBox? renderObject =
                    key.currentContext?.findRenderObject() as RenderBox?;
                LogUtils.e("${renderObject!.size}", Tag: "ike");
              });
              return CircularProgressIndicator(
                key: key,
              );
            },
          ),
        ),
      ),
    );
    //   Container(
    //   child: ListView(
    //     children: [
    //       Row(
    //         children: [
    //           Expanded(
    //             child: Center(
    //               child: Container(
    //                   color: Colors.amberAccent,
    //                   width: 50,
    //                   height: 100,
    //                   child: CircularProgressIndicator()),
    //             ),
    //           )
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
