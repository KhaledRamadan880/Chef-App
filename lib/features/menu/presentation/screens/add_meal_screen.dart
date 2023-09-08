import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/commons.dart';
import 'package:chef_app/core/util/images.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/widgets/custom_app_bar.dart';
import 'package:chef_app/core/util/widgets/custom_text_field.dart';
import 'package:chef_app/features/menu/presentation/components/photo_select_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: AppStrings.addMeal.tr(context),
        context: context,
        route: '/menu',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Column(
              children: [
                //! Image
                SizedBox(
                  height: 170.h,
                  width: 170.w,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(AppImages.addMeal),
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
                          height: 40,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                //! Name TextField
                CustomTextField(
                  hint: AppStrings.name.tr(context),
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 24),
                //! Price TextField
                CustomTextField(
                  hint: AppStrings.price.tr(context),
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 24),
                //! Category TextField
                CustomTextField(
                  hint: AppStrings.category.tr(context),
                  controller: TextEditingController(),
                  // suffixIcon: IconButton,
                ),
                const SizedBox(height: 24),
                //! Description TextField
                CustomTextField(
                  hint: AppStrings.description.tr(context),
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
