import 'package:chef_app/core/util/theme/theme.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/images.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.logo),
            const SizedBox(height: 16),
            Text(
              AppStrings.chefApp,
              style: appTheme().textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
