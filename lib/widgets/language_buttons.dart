/*

  Created by: Bakhromjon Polat
  Created on: Jan 04 2024 19:50:44
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/widgets/scale_animation.dart';

class LanguageButtons extends StatelessWidget {
  final ValueChanged<String> onLocaleChanged;
  final String locale;
  const LanguageButtons({
    super.key,
    required this.locale,
    required this.onLocaleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ['uz', 'cr']
          .map(
            (e) => Expanded(
              child: ScaleAnimation(
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: locale == e ? AppColors.green : AppColors.background,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.green),
                  ),
                  child: Text(
                    e == 'uz' ? 'Lotin' : 'Кирилл',
                    style: TextStyle(
                      color: locale == e ? AppColors.white : null,
                    ),
                  ),
                ),
                onTap: () => onLocaleChanged(e),
              ),
            ),
          )
          .toList(),
    );
  }
}
