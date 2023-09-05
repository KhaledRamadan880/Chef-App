
import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMealItem extends StatelessWidget {
  const CustomMealItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 150.h,
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          // image
          SizedBox(
            width: 60.w,
            height: 60.h,
            child: Image.network(''),
          ),
          SizedBox(width: 16.w),
          // column text
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
          // Cancel Icon Button
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
