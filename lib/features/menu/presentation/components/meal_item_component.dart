import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/database/local/app_locale.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/strings.dart';
import 'package:chef_app/core/util/theme/theme.dart';
import 'package:chef_app/core/util/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomMealItem extends StatelessWidget {
  const CustomMealItem({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      height: 120.h,
      // padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          //! Image
          SizedBox(
            width: 80.w,
            height: 80.h,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: AppColors.grey,
                highlightColor: AppColors.white,
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(width: 16.w),
          //! column text
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kitchen',
                style: appTheme().textTheme.labelMedium!.copyWith(
                      color: AppColors.black,
                    ),
              ),
              Text(
                'Chicken hint',
                style: appTheme().textTheme.labelMedium!.copyWith(
                      color: AppColors.grey,
                    ),
              ),
              Text(
                '200 LE',
                style: appTheme().textTheme.labelMedium!.copyWith(
                      color: AppColors.grey,
                    ),
              ),
            ],
          ),
          const Spacer(),
          //! Cancel Icon Button
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return CustomAlertDialog(
                      message: AppStrings.mealDelete.tr(context),
                      confirmAction: () {},
                    );
                  }));
            },
            icon: const Icon(
              Icons.cancel,
              color: AppColors.red,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
