import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/routes/routes.dart';
import 'package:chef_app/core/util/widgets/custom_app_bar.dart';
import 'package:chef_app/core/util/widgets/custom_text_field.dart';
import 'package:chef_app/core/util/widgets/primary_button.dart';
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
      appBar: customAppBar(title: AppStrings.createYourNewPassword.tr(context)),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
            child: Column(
              children: [
                //! Lock Image
                Image.asset(
                  AppImages.lock,
                  height: 300.h,
                ),
                SizedBox(height: 26.h),
                //! Title
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.createYourNewPassword.tr(context),
                    style: appTheme().textTheme.bodySmall!.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ),
                SizedBox(height: 24.h),
                //! New Password TextField
                CustomTextField(hint: AppStrings.newPassword.tr(context)),
                SizedBox(height: 30.h),
                //! Confirm Password TextField
                CustomTextField(hint: AppStrings.confirmPassword.tr(context)),
                SizedBox(height: 30.h),
                //! Code TextField
                const CustomTextField(hint: AppStrings.code),
                SizedBox(height: 30.h),
                //! Reset Button
                PrimaryButton(
                  title: AppStrings.sendResetLink.tr(context),
                  route: Routes.login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
