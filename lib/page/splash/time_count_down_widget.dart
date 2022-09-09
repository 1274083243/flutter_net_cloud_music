import 'dart:async';

import 'package:flutter/material.dart';

class TimeCountDownWidget extends StatefulWidget {
  const TimeCountDownWidget({Key? key}) : super(key: key);

  @override
  State<TimeCountDownWidget> createState() => _TimeCountDownWidgetState();
}

class _TimeCountDownWidgetState extends State<TimeCountDownWidget> {
  late Timer timer;
  String jumpContent = "5s|跳过";
  int count = 0;
  int maxTime = 5;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        count++;
        if(count<=maxTime) {
          jumpContent = "${maxTime - count}s|跳过";
        }else{
          timer.cancel();
        }
      });
    }
    );
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.all(const Radius.circular(10)),
          color: Colors.grey.withAlpha(100),
      ),
      alignment: Alignment.center,
      width: 60,
      height: 30,
      child:  Text(
        jumpContent
      ,
      style: const TextStyle(
      fontSize: 10,
      color: Colors.white,
      decoration: TextDecoration.none
      ),
    ),);
  }
}
