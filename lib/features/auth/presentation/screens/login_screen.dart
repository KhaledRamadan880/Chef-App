import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/routes/routes.dart';
import 'package:chef_app/core/util/widgets/custom_text_field.dart';
import 'package:chef_app/core/util/widgets/primary_button.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/images.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/theme/theme.dart';
import 'package:chef_app/features/auth/presentation/screens/send_code_screen.dart';
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
                  AppStrings.welcomeBack.tr(context),
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
                    CustomTextField(
                      hint: AppStrings.email.tr(context),
                    ),
                    SizedBox(height: 48.h),
                    //! Password TextField
                    CustomTextField(
                      hint: AppStrings.password.tr(context),
                      suffixShow: true,
                      obscure: true,
                    ),
                    //! Forget Password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SendCodeScreen()));
                        },
                        child: Text(
                          AppStrings.forgetPassword.tr(context),
                          style: appTheme().textTheme.labelSmall!.copyWith(
                                color: AppColors.grey,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    //! Sign in Button
                    PrimaryButton(
                        title: AppStrings.signIn.tr(context), route: Routes.menu),
                    SizedBox(height: 50.h),
                    //! Sign up Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.dontHaveAnAccount.tr(context),
                          style: appTheme().textTheme.labelMedium,
                        ),
                        //! Sign up Button
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            AppStrings.signUp.tr(context),
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
