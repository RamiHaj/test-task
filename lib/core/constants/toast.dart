import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String text,
  required ToastColors color,
})
{
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: setToastColor(color),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

enum ToastColors{
  success,
  error,
  warning
}

Color setToastColor(ToastColors color)
{
  Color c;
  switch(color)
  {
    case ToastColors.success:
      c = Colors.green;
      break;
    case ToastColors.error:
      c = Colors.red;
      break;
    case ToastColors.warning:
      c = Colors.amber;
      break;
  }

  return c;
}