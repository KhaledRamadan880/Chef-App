import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/commons.dart';
import 'package:chef_app/core/util/images.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/widgets/custom_app_bar.dart';
import 'package:chef_app/core/util/widgets/custom_text_field.dart';
import 'package:chef_app/core/util/widgets/primary_button.dart';
import 'package:chef_app/features/menu/presentation/components/photo_select_dialog.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                BlocConsumer<MenuCubit, MenuState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Form(
                      key: BlocProvider.of<MenuCubit>(context).addMealKey,
                      child: Form(
                        child: Column(
                          children: [
                            //! Name TextField
                            CustomTextField(
                              hint: AppStrings.name.tr(context),
                              controller: BlocProvider.of<MenuCubit>(context)
                                  .mealNameController,
                            ),
                            const SizedBox(height: 24),
                            //! Price TextField
                            CustomTextField(
                              hint: AppStrings.price.tr(context),
                              controller: BlocProvider.of<MenuCubit>(context)
                                  .mealPriceController,
                            ),
                            const SizedBox(height: 24),
                            //! Category Drop Down Button
                            Container(
                              width: double.maxFinite,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButton(
                                underline: Container(),
                                isExpanded: true,
                                hint: Text(
                                  BlocProvider.of<MenuCubit>(context)
                                      .selectedItem,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: AppColors.grey,
                                        fontSize: 16,
                                      ),
                                ),
                                items: BlocProvider.of<MenuCubit>(context)
                                    .categoryList
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  BlocProvider.of<MenuCubit>(context)
                                      .changeItem(value);
                                },
                              ),
                            ),

                            const SizedBox(height: 24),

                            //! Description TextField
                            CustomTextField(
                              hint: AppStrings.description.tr(context),
                              controller: BlocProvider.of<MenuCubit>(context)
                                  .mealDescController,
                            ),
                            const SizedBox(height: 24),

                            //! Add Meal Button
                            PrimaryButton(
                              title: AppStrings.addMeal.tr(context),
                              onPressed: () {},
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
        ),
      ),
    );
  }
}
