import 'package:flutter/material.dart';
import 'package:yaaseen/core/constants/app_colors.dart';

class AppRadioListTile extends StatelessWidget {
  final String value;
  final ValueChanged<Object?>? onChanged;
  final String group;
  const AppRadioListTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      title: Text(value == 'uz' ? 'Lotin' : 'Кирилл'),
      onChanged: onChanged,
      groupValue: group,
      activeColor: AppColors.green,
    );
  }
}
