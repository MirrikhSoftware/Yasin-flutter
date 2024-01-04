/*

  Created by: Bakhromjon Polat
  Created on: Jan 04 2024 22:10:15
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';

class TextSizeSlider extends StatelessWidget {
  final String title;
  final ValueChanged<double> onSlides;
  final ValueChanged<bool> onChecked;
  final bool checkBoxValue;
  final double textSize;
  final bool enable;
  const TextSizeSlider({
    super.key,
    required this.onSlides,
    required this.title,
    required this.textSize,
    required this.checkBoxValue,
    required this.onChecked,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(title),
        ),
        Row(
          children: [
            SizedBox(
              height: 32,
              child: Checkbox(
                activeColor: Theme.of(context).primaryColor,
                value: checkBoxValue,
                onChanged: enable ? (value) => onChecked(value ?? false) : null,
              ),
            ),
            Expanded(
              child: Slider(
                value: textSize,
                label: '$textSize',
                onChanged: checkBoxValue ? onSlides : null,
                divisions: 32 - 12,
                min: 12,
                max: 32,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
