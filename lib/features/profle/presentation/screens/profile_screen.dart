import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/routes/routes.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/commons.dart';
import 'package:chef_app/core/util/images.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/features/menu/presentation/components/photo_select_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 70.h,
            ),

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
            SizedBox(height: 14.h),

            //! Name
            Text(
              'Full Name',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.black,
                  ),
            ),
            SizedBox(height: 14.h),

            //! Email
            Text(
              'khaledramdan880@gmail.com',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.black,
                  ),
            ),
            SizedBox(height: 14.h),

            //! Features
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                children: [
                  //! Edit Profile
                  ProfileListTile(
                    icon: Icons.person_outline_outlined,
                    title: AppStrings.editProfile,
                    onTap: () {
                      navigateReplacement(
                          context: context, route: Routes.editProfile);
                    },
                  ),
                  ProfileListTile(
                    icon: Icons.visibility_off_outlined,
                    title: AppStrings.password,
                    onTap: () {
                      navigateReplacement(
                          context: context, route: Routes.changePassword);
                    },
                  ),
                  ProfileListTile(
                    icon: Icons.settings,
                    title: AppStrings.settings,
                    onTap: () {},
                  ),
                  ProfileListTile(
                    icon: Icons.logout,
                    title: AppStrings.logout,
                    iconColor: AppColors.primary,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.icon,
    required this.title,
    this.iconColor = AppColors.black,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: iconColor,
      ),
      title: Text(
        title.tr(context),
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: AppColors.black,
            ),
      ),
      horizontalTitleGap: 0,
      dense: true,
      visualDensity: VisualDensity.compact,
    );
  }
}
