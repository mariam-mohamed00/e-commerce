import 'package:flutter/material.dart';

import 'my_theme.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: MyTheme.whiteColor,
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 12,
              ),
              Text(message),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context, String message,
      {String title = 'Title',
      String? posActionName,
      VoidCallback? posAction,
      String? negActionName,
      VoidCallback? negAction,
      bool barrierDismissible = true}) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            posAction?.call();
            Navigator.pop(context);
          },
          child: Text(posActionName)));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName)));
    }
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: MyTheme.whiteColor,
          content: Text(message),
          title: Text(title, style: TextStyle(color: MyTheme.darkPrimaryColor)),
          actions: actions,
          titleTextStyle: TextStyle(color: MyTheme.darkPrimaryColor),
        );
      },
    );
  }
}
