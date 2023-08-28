import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title, required this.route,
    
  });
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        navigate(context: context, route: route);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => widget));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: EdgeInsets.all(3.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        fixedSize: Size(double.maxFinite, 50.h),
      ),
      child: Text(title),
    );
  }
}
