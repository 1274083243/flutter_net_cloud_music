import 'package:flutter/material.dart';
import 'package:flutter_net_cloud_music/utils/hex_color.dart';

class LoginBtnWidget extends StatefulWidget {
  final bool enable;
  final bool isInLogin;
  final VoidCallback press;

  const LoginBtnWidget(
      {Key? key,
      required this.enable,
      required this.press,
      required this.isInLogin})
      : super(key: key);

  @override
  State<LoginBtnWidget> createState() => _LoginBtnWidgetState();
}

class _LoginBtnWidgetState extends State<LoginBtnWidget> {
  @override
  Widget build(BuildContext context) {
    return _createLoginWidget();
  }

  _createLoginWidget() {
    return GestureDetector(
      onTap: widget.enable ? widget.press : null,
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Container(
          alignment: Alignment.center,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.enable ? HexColor("#DD2819") : Colors.grey,
          ),
          child: !widget.isInLogin
              ? const Text(
                  "登录",
                  style: TextStyle(color: Colors.white),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "登录中...",
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
