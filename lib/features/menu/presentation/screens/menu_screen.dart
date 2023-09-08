import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/util/commons.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/widgets/primary_button.dart';
import 'package:chef_app/features/menu/presentation/components/meal_item_component.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: Column(
          children: [
            //! Add Meal Button
            PrimaryButton(
              title: AppStrings.addDishToMenu.tr(context),
              onPressed: () {
                navigateNamed(context: context, route: '/addMeal');
              },
            ),
            //! Meals
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const Column(
                    children: [
                      CustomMealItem(
                        imageUrl:
                            'https://hips.hearstapps.com/hmg-prod/images/healthy-chicken-recipes-1641586837.jpeg?crop=1.00xw:0.995xh;0,0&resize=640:*',
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
