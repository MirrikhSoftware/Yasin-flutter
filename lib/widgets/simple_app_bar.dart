import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget with PreferredSizeWidget {
  const SimpleAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
