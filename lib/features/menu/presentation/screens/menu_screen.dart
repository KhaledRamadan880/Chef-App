import 'package:chef_app/core/util/color.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Menu Screen',
        style: TextStyle(color: AppColors.black),
      )),
    );
  }
}
