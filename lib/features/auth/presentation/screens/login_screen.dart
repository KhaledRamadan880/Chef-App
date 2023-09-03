import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/bloc/cubit/global_state.dart';
import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/routes/routes.dart';
import 'package:chef_app/core/util/commons.dart';
import 'package:chef_app/core/util/widgets/custom_text_field.dart';
import 'package:chef_app/core/util/widgets/primary_button.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/images.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/theme/theme.dart';
import 'package:chef_app/features/auth/presentation/cubits/cubit/login_cubit.dart';
import 'package:chef_app/features/auth/presentation/cubits/cubit/login_state.dart';
import 'package:chef_app/features/auth/presentation/screens/send_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Form(
                  key: BlocProvider.of<LoginCubit>(context).loginKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: Column(
                      children: [
                        //! Email TextField
                        CustomTextField(
                          controller: BlocProvider.of<LoginCubit>(context)
                              .emailController,
                          hint: AppStrings.email.tr(context),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !value.contains('@gmail.com')) {
                              return AppStrings.pleaseEnterValidEmail
                                  .tr(context);
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 48.h),
                        // //! Password TextField
                        BlocBuilder<GlobalCubit, GlobalState>(
                          builder: (context, state) {
                            return CustomTextField(
                              controller: BlocProvider.of<LoginCubit>(context)
                                  .passController,
                              hint: AppStrings.password.tr(context),
                              suffixShow: true,
                              obscure: BlocProvider.of<GlobalCubit>(context)
                                  .obscured,
                              suffixIcon: BlocProvider.of<GlobalCubit>(context)
                                  .suffixIcon(),
                              validator: (value) {
                                if (value!.isEmpty || value.length <= 6) {
                                  return AppStrings.pleaseEnterValidPassword
                                      .tr(context);
                                }
                                return null;
                              },
                            );
                          },
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
                          title: AppStrings.signIn.tr(context),
                          route: Routes.menu,
                          onPressed: () {
                            if (BlocProvider.of<LoginCubit>(context)
                                .loginKey
                                .currentState!
                                .validate()) {
                              BlocProvider.of<LoginCubit>(context).login();
                              navigate(context: context, route: '/menu');
                            }
                          },
                        ),
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
                                style: appTheme()
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
