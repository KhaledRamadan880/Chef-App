import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/routes/routes.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/commons.dart';
import 'package:chef_app/core/util/images.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/widgets/custom_app_bar.dart';
import 'package:chef_app/core/util/widgets/custom_text_field.dart';
import 'package:chef_app/core/util/widgets/primary_button.dart';
import 'package:chef_app/features/menu/presentation/components/photo_select_dialog.dart';
import 'package:chef_app/features/profle/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: AppStrings.editProfile.tr(context),
        context: context,
        route: Routes.profile,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                //! Image
                Container(
                  // height: 150.h,
                  width: 150.w,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    border: Border.all(
                      width: 2,
                      color: AppColors.primary,
                    ),
                  ),
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage(AppImages.user),
                        ),
                      ),
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        bottom: 0,
                        end: 0,
                        child: MaterialButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return PhotoSelectedDialog(
                                  cameraOnTap: () {
                                    Navigator.pop(context);
                                    imagePicker(ImageSource.camera);
                                  },
                                  galleryOnTap: () {
                                    Navigator.pop(context);
                                    imagePicker(ImageSource.gallery);
                                  },
                                );
                              },
                            );
                          },
                          color: AppColors.primary,
                          minWidth: 10,
                          height: 35,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: AppColors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                //! Name TextField
                CustomTextField(
                  hint: AppStrings.name.tr(context),
                  controller: TextEditingController(),
                ),
                SizedBox(height: 24.h),

                //! Phone TextField
                CustomTextField(
                  hint: AppStrings.phoneNumber.tr(context),
                  controller: TextEditingController(),
                ),
                SizedBox(height: 24.h),

                //! Brand Name TextField
                CustomTextField(
                  hint: AppStrings.brand.tr(context),
                  controller: TextEditingController(),
                ),
                SizedBox(height: 24.h),

                //! Minimim Charge TextField
                CustomTextField(
                  hint: AppStrings.minimumCharge.tr(context),
                  controller: TextEditingController(),
                ),
                SizedBox(height: 24.h),

                //! Descreption Charge TextField
                CustomTextField(
                  hint: AppStrings.description.tr(context),
                  controller: TextEditingController(),
                ),
                SizedBox(height: 24.h),

                //! Location Charge TextField
                CustomTextField(
                  hint: AppStrings.location.tr(context),
                  controller: TextEditingController(),
                ),
                SizedBox(height: 24.h),

                //! Update Button
                PrimaryButton(
                  title: AppStrings.update.tr(context),
                  onPressed: () {
                    BlocProvider.of<ProfileCubit>(context).updateProfile();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
