import 'package:flutter/material.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/widgets/scale_animation.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double? width;
  const RoundedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleAnimation(
      onTap: onPressed,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.green, width: 2.0),
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: Icon(icon, size: 18.0),
      ),
    );
  }
}
