import 'package:flutter/material.dart';
import 'package:yaaseen/route/routes.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      actions: [
        _setPopupMenuButton(),
      ],
    );
  }

  PopupMenuButton _setPopupMenuButton() => PopupMenuButton(
        itemBuilder: (context) {
          return [
            _setItem('Sozlamalar'),
          ];
        },
        onSelected: (v) {
          switch (v) {
            case 'Sozlamalar':
              AppNavigator.pushNamed(RouteNames.settings);
              break;
          }
        },
      );
  PopupMenuItem _setItem(String title) => PopupMenuItem(
        child: Text(title),
        value: title,
      );

  @override
  Size get preferredSize => const Size(double.infinity, kTextTabBarHeight);
}
