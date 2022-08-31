import 'package:flutter/material.dart';
import 'package:yaaseen/core/core.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const RoundedIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: _borderRadius(),
      child: Container(
        child: Icon(icon, size: 18.r),
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary, width: 2.w),
          borderRadius: _borderRadius(),
        ),
      ),
    );
  }

  BorderRadius _borderRadius() => BorderRadius.circular(32.r);
}