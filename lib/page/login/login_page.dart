import 'package:flutter/material.dart';
import 'package:flutter_net_cloud_music/utils/hex_color.dart';
import 'package:flutter_net_cloud_music/utils/log_utils.dart';
import 'package:flutter_net_cloud_music/widget/login/login_btn_widget.dart';

import '../../widget/login/login_input_text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userPhoneNum = "";
  String userPwd = "";
  bool btnEnable = false;
  bool isInLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 40, right: 40),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                "images/icon_logo.png",
                width: 50,
                height: 50,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Welcome Back",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Text(
              "The Flutter Netease Clound Music App",
              style: TextStyle(color: HexColor("#999999")),
            ),
            LoginInputTextWidget(
              leftIcon: Icons.mobile_friendly,
              hintText: "请输入电话号码",
              isPwd: false,
              changed: (content) {
                userPhoneNum = content;
                LogUtils.e("userPhoneNum:$userPhoneNum");
                _checkInputIsValidate();
              },
            ),
            LoginInputTextWidget(
                leftIcon: Icons.lock,
                hintText: "请输入密码",
                isPwd: true,
                changed: (content) {
                  userPwd = content;
                  LogUtils.e("userPwd:$userPwd");
                  _checkInputIsValidate();
                }),
            LoginBtnWidget(
              enable: btnEnable,
              isInLogin: isInLogin,
              press: () {
                doLoginAction();
              },
            )
          ],
        ),
      ),
    );
  }

  _checkInputIsValidate() {
    if (userPwd.isEmpty || userPhoneNum.isEmpty) {
      btnEnable = false;
    } else {
      btnEnable = true;
    }
    setState(() {});
  }

  void doLoginAction() {
    setState(() {
      isInLogin = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isInLogin = false;
      });
    });
  }
}
