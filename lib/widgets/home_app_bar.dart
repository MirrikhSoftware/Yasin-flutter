import 'package:flutter/material.dart';
import 'package:yaaseen/core/constants/app_strings.dart';
import 'package:yaaseen/route/routes.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: Text(AppStrings.app_name.tr()),
      actions: [
        _setPopupMenuButton(),
      ],
    );
  }

  PopupMenuButton _setPopupMenuButton() => PopupMenuButton(
        itemBuilder: (context) {
          return [
            _setItem(AppStrings.settings),
          ];
        },
        onSelected: (v) {
          switch (v) {
            case AppStrings.settings:
              AppNavigator.pushNamed(RouteNames.settings);
              break;
          }
        },
      );
  PopupMenuItem _setItem(String title) => PopupMenuItem(
        child: Text(title.tr()),
        value: title,
      );

  @override
  Size get preferredSize => const Size(double.infinity, kTextTabBarHeight);
}