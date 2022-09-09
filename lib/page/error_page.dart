import 'package:flutter/material.dart';
import 'package:flutter_net_cloud_music/base/widget/base_page_stateful.dart';

class ErrorPage extends BasePageStateful {
  final String errorMessage;
  final FlutterErrorDetails details;

  const ErrorPage(this.errorMessage, this.details);

  @override
  ErrorPageState createState() => ErrorPageState();
}

class ErrorPageState extends State<ErrorPage> {
  static List<Map<String, dynamic>?> sErrorStack = [];
  static List<String?> sErrorName = [];

  final TextEditingController textEditingController =
      new TextEditingController();

  addError(FlutterErrorDetails details) {
    try {
      var map = <String, dynamic>{};
      map["error"] = details.toString();
      // LogsInterceptors.addLogic(
      //     sErrorName, details.exception.runtimeType.toString());
      // LogsInterceptors.addLogic(sErrorStack, map);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
    return Container(
      color: Colors.blue,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: width,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(30),
            gradient:
                RadialGradient(tileMode: TileMode.mirror, radius: 0.1, colors: [
              Colors.white.withAlpha(10),
              Colors.red.withAlpha(100),
            ]),
            borderRadius: BorderRadius.all(Radius.circular(width / 2)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.settings, size: 90),
              const SizedBox(
                height: 11,
              ),
              const Material(
                color: Colors.red,
                child: Text(
                  "Error Occur",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white.withAlpha(100),
                    ),
                    // onPressed: () {
                    //   String content = widget.errorMessage;
                    //   textEditingController.text = content;
                    //   CommonUtils.showEditDialog(
                    //       context,
                    //       GSYLocalizations.i18n(context)!.home_reply,
                    //           (title) {}, (res) {
                    //     content = res;
                    //   }, () {
                    //     if (content.length == 0) {
                    //       return;
                    //     }
                    //     CommonUtils.showLoadingDialog(context);
                    //     IssueDao.createIssueDao(
                    //         "CarGuo", "gsy_github_app_flutter", {
                    //       "title": GSYLocalizations.i18n(context)!.home_reply,
                    //       "body": content
                    //     }).then((result) {
                    //       Navigator.pop(context);
                    //       Navigator.pop(context);
                    //     });
                    //   },
                    //       titleController: new TextEditingController(),
                    //       valueController: textEditingController,
                    //       needTitle: false);
                    // },
                    onPressed: () {  },
                    child: const Text("Report"),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white.withAlpha(100)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Back")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
