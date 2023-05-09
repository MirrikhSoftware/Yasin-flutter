import 'package:flutter/material.dart';
import 'package:yaaseen/core/core.dart';

class AppCheckboxListTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?>? onChanged;
  const AppCheckboxListTile({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      title: Transform.translate(
        offset: const Offset(-15.0, 0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 12.0),
        ),
      ),
      onChanged: onChanged,
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: AppColors.green,
    );
  }
}
