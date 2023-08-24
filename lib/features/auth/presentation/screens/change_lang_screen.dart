import 'package:chef_app/core/util/images.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/lang_button.dart';

class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! body
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.bg1), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            SizedBox(height: 115.h),
            //! Logo
            Image.asset(AppImages.logo),
            SizedBox(height: 16.h),
            //! Title 1
            Text(
              AppStrings.welcome,
              style: appTheme().textTheme.bodyMedium,
            ),
            SizedBox(height: 54.h),
            //! Title 2
            Text(
              AppStrings.selectLang,
              style: appTheme().textTheme.bodySmall,
            ),
            SizedBox(height: 120.h),
            //! Buttons Row
            const Row(
              children: [
                //! English Button
                LangButton(title: AppStrings.english),
                Spacer(),
                //! Arabic Row
                LangButton(title: AppStrings.arabic),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
