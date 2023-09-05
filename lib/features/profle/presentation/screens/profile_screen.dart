import 'package:chef_app/core/util/color.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Profile Screen',
        style: TextStyle(color: AppColors.black),
      )),
    );
  }
}
