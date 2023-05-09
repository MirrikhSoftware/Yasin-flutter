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
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.green, width: 2.0),
          borderRadius: _borderRadius(),
        ),
        child: Icon(icon, size: 18.0),
      ),
    );
  }

  BorderRadius _borderRadius() => BorderRadius.circular(32.0);
}
