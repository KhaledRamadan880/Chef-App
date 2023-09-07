import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMealItem extends StatelessWidget {
  const CustomMealItem({
    super.key, required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 150.h,
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          //! Image
          SizedBox(
            width: 60.w,
            height: 60.h,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(),
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
            onPressed: () {},
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
