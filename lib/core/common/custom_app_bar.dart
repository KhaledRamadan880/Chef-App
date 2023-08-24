  import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/icons.dart';
import 'package:flutter/material.dart';

AppBar customAppBar({required String title}) {
    return AppBar(
      leading: AppIcons.back,
      title: Text(title),
      backgroundColor: AppColors.primary,
      elevation: 0,
    );
  }
