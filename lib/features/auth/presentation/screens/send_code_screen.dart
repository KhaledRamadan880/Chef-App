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

class SendCodeScreen extends StatelessWidget {
  const SendCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: AppStrings.forgetPassword.tr(context)),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //! Lock IMage
              Image.asset(
                AppImages.lock,
                height: 300.h,
              ),
              SizedBox(height: 26.h),
              //! Title
              Text(
                AppStrings.pleaseEnterValidEmail.tr(context),
                textAlign: TextAlign.center,
                style: appTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                    ),
              ),
              SizedBox(height: 26.h),
              //! Email TextField
               CustomTextField(hint: AppStrings.email.tr(context)),
              SizedBox(height: 30.h),
              //! Send Code Button
              PrimaryButton(
                title: AppStrings.sendResetLink.tr(context),
                route: Routes.createNewPass,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
