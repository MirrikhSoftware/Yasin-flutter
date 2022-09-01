import 'package:flutter/material.dart';

class AppRadioListTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<Object?>? onChanged;
  final String group;
  const AppRadioListTile({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      title: Text(title),
      onChanged: onChanged,
      groupValue: group,
    );
  }
}
