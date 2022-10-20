

import 'package:flutter/material.dart';
import 'package:yaaseen/core/core.dart';

class AppShape {
  static circularBorder({double radius = 8.0}) => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.r),
      );

  static simple({double radius = 10, Color color = AppColors.green}) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius.r),
      );


  static cardDesign({
    double radius = 10,
    Color color = AppColors.green,
  }) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius.r),
        boxShadow: [
          BoxShadow(blurRadius: 3.r, color: AppColors.black.withOpacity(.5)),
          // BoxShadow(blurRadius: 5.r, color: AppColors.grey),
        ],
      );
}
