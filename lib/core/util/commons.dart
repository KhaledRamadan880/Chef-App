import 'package:chef_app/core/util/color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateNamed({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushNamed(context, route);
}
void navigateReplacement({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushReplacementNamed(context, route);
}

void toast({required String message, required ToastStates state}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    textColor: AppColors.white,
    fontSize: 18,
    timeInSecForIosWeb: 3,
    backgroundColor: getState(state),
  );
}

enum ToastStates { error, success, warning }

Color getState(ToastStates state) {
  switch (state) {
    case ToastStates.error:
      return AppColors.red;
    case ToastStates.success:
      return AppColors.green;
    case ToastStates.warning:
      return AppColors.primary;
  }
}
