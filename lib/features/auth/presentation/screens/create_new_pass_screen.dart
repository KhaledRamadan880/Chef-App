import 'package:chef_app/core/common/custom_app_bar.dart';
import 'package:chef_app/core/common/custom_text_field.dart';
import 'package:chef_app/core/common/primary_button.dart';
import 'package:chef_app/core/util/images.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPassScreen extends StatelessWidget {
  const CreateNewPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: AppStrings.createNewPass),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
            child: Column(
              children: [
                //! Lock IMage
                Image.asset(
                  AppImages.lock,
                  height: 300.h,
                ),
                SizedBox(height: 26.h),
                //! Title
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.createNewPass,
                    style: appTheme().textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ),
                SizedBox(height: 24.h),
                //! Email TextField
                const CustomTextField(hint: AppStrings.newPass),
                SizedBox(height: 30.h),
                const CustomTextField(hint: AppStrings.confirmPass),
                SizedBox(height: 30.h),
                const CustomTextField(hint: AppStrings.code),
                SizedBox(height: 30.h),
                //! Send Code Button
                const PrimaryButton(title: AppStrings.resetPass),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
