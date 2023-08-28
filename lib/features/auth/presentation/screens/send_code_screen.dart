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
      appBar: customAppBar(title: AppStrings.forgetPass),
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
                AppStrings.enterEmail,
                textAlign: TextAlign.center,
                style: appTheme().textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                    ),
              ),
              SizedBox(height: 26.h),
              //! Email TextField
              const CustomTextField(hint: AppStrings.email),
              SizedBox(height: 30.h),
              //! Send Code Button
              const PrimaryButton(
                title: AppStrings.sendCode,
                route: Routes.createNewPass,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
