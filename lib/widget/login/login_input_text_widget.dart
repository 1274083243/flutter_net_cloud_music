import 'package:flutter/material.dart';
import 'package:flutter_net_cloud_music/utils/hex_color.dart';

class LoginInputTextWidget extends StatefulWidget {
  final IconData leftIcon;
  final String hintText;
  final bool isPwd;
  final ValueChanged<String> changed;

  const LoginInputTextWidget(
      {Key? key,
      required this.leftIcon,
      required this.hintText,
      required this.isPwd,
      required this.changed})
      : super(key: key);

  @override
  State<LoginInputTextWidget> createState() => _LoginInputTextWidgetState();
}

class _LoginInputTextWidgetState extends State<LoginInputTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Icon(
            widget.leftIcon,
            size: 20,
          ),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
            child: TextField(
              onChanged: widget.changed,
              obscureText: widget.isPwd,
              cursorColor: HexColor("#DD2819"),
              decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: HexColor("#999999"))),
            ),
          )
        ],
      ),
      Container(
        height: 1,
        color: HexColor("#DD2819"),
      ),
    ]);
  }
}
