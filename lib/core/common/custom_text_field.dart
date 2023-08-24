import 'package:chef_app/core/util/color.dart';
import 'package:chef_app/core/util/icons.dart';
import 'package:chef_app/core/util/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool suffixShow;
  final bool obscure;

  const CustomTextField({
    super.key,
    required this.hint,
    this.suffixShow = false,
    this.obscure = false,
  });

  final bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.darkGrey,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: appTheme().textTheme.bodySmall!.copyWith(
              color: AppColors.darkGrey,
              fontSize: 16,
            ),
        contentPadding: const EdgeInsets.all(16),
        suffixIcon: suffixShow == true
            ? IconButton(
                onPressed: () {
                  isVisible != isVisible;
                },
                icon: isVisible == true
                    ? AppIcons.passwordShow
                    : AppIcons.passwordHide,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.darkGrey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.darkGrey,
            width: 1,
          ),
        ),
      ),
    );
  }
}
