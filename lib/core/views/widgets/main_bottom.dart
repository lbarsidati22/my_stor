import 'package:flutter/material.dart';

import 'package:my_stor/core/utils/theme/app_colors.dart';

class MainBottom extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  final bool isLeading;
  final Color backGroundColor;
  final double height;
  MainBottom({
    super.key,
    this.onTap,
    this.text,
    this.isLeading = false,
    this.backGroundColor = AppColors.primaryColor,
    this.height = 60,
  }) {
    assert(
      text != null || isLeading == true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor,
        ),
        onPressed: onTap,
        child: isLeading
            ? CircularProgressIndicator.adaptive(
                backgroundColor: AppColors.white,
              )
            : Text(
                text!,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.white,
                    ),
              ),
      ),
    );
  }
}
