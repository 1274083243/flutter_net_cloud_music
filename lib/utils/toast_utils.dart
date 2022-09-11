import 'package:fluttertoast/fluttertoast.dart';

///弹出Toast
void showToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR);
}
