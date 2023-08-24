import 'package:chef_app/core/common/custom_text_field.dart';
import 'package:chef_app/core/common/primary_button.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/images.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Welcome Container
            Container(
              width: double.maxFinite,
              height: 222.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.bg2),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Text(
                  AppStrings.wecomeBack,
                  style: appTheme().textTheme.bodyMedium!.copyWith(
                        color: AppColors.white,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 80),
            //! Form
            Form(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.h),
                child: Column(
                  children: [
                    //! Email TextField
                    const CustomTextField(
                      hint: AppStrings.email,
                    ),
                    SizedBox(height: 48.h),
                    //! Password TextField
                    const CustomTextField(
                      hint: AppStrings.password,
                      suffixShow: true,
                      obscure: true,
                    ),
                    //! Forget Password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.isForgetPass,
                          style: appTheme().textTheme.labelSmall!.copyWith(
                                color: AppColors.grey,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    //! Sign in Button
                    const PrimaryButton(title: AppStrings.signIn),
                    SizedBox(height: 50.h),
                    //! Sign up Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.dontHaveAccount,
                          style: appTheme().textTheme.labelMedium,
                        ),
                        //! Sign up Button
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            AppStrings.signUp,
                            style: appTheme().textTheme.labelMedium!.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
