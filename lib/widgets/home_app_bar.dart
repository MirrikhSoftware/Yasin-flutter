import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        _setPopupMenuButton(),
      ],
    );
  }

  PopupMenuButton _setPopupMenuButton() => PopupMenuButton(
        itemBuilder: (context) {
          return [
            _setItem(),
          ];
        },
      );
  PopupMenuItem _setItem() => PopupMenuItem(
    child: Text('data'),
  );

  @override
  Size get preferredSize => const Size(double.infinity, kTextTabBarHeight);
}
