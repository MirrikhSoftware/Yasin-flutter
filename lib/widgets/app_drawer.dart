import 'package:flutter/material.dart';
import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/core/constants/constants.dart';
import 'package:yaaseen/route/routes.dart';

/// It's a stateful widget that displays a drawer with a list of options

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                AppIcons.app_icon,
                height: 64.0,
                width: 64.0,
              ),
            ),
            Text(
              AppStrings.app_name.tr(),
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            _setTitle(
              key: AppKeys.readingMode,
              icon: AppIcons.alif,
              title: AppStrings.arabic_text.tr(),
              onTap: () {
                AppNavigator.pushNamed(RouteNames.reading);
              },
            ),
            _setTitle(
              key: AppKeys.bookmarks,
              icon: AppIcons.bookmark_outlined,
              title: AppStrings.bookmarks.tr(),
              onTap: () {
                AppNavigator.pushNamed(RouteNames.bookmarks);
              },
            ),
            // Badge(
            //   showBadge: false,
            //   position: BadgePosition(top: 8.0, start: 8.w),
            //   child: _setTitle(
            //     icon: AppIcons.alert,
            //     title: AppStrings.news.tr(),
            //     onTap: () {
            //       AppNavigator.pushNamed(RouteNames.news).then(
            //         (value) => setState(() {}),
            //       );
            //     },
            //   ),
            // ),
            _setTitle(
              key: AppKeys.settings,
              icon: AppIcons.settings,
              title: AppStrings.settings.tr(),
              onTap: () {
                AppNavigator.pushNamed(RouteNames.settings);
              },
            ),
            // _setTitle(
            //     icon: AppIcons.book,
            //     title: 'Ilova haqida',
            //     onTap: () {
            //       AppNavigator.pushNamed(RouteNames.about);
            //     }),
            _setTitle(
              key: AppKeys.rate,
              icon: AppIcons.rating_outlined,
              title: AppStrings.rate_app.tr(),
              onTap: () async {
                InAppReview inAppReview = InAppReview.instance;
                await inAppReview.openStoreListing();
              },
            ),
            _setTitle(
              key: AppKeys.shareApp,
              icon: AppIcons.share,
              title: AppStrings.share_app.tr(),
              onTap: () async {
                await Share.share(
                  '${AppStrings.download_app.tr()}\n\n${AppStrings.app_link}',
                );
              },
            ),

            const Spacer(),
            ListTile(
              title: Text(AppStrings.version.tr()),
              trailing: FutureBuilder(
                future: PackageInfo.fromPlatform(),
                builder: (context, AsyncSnapshot<PackageInfo> snap) {
                  if (snap.hasData) {
                    return Text(snap.requireData.version);
                  }

                  return const SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  /// It returns a ListTile widget with a leading icon and a title.
  ///
  /// Args:
  ///   icon (String): The icon to be displayed on the left side of the list tile.
  ///   title (String): The title of the list tile.
  ///   onTap (VoidCallback): This is the function that will be called when the user taps on the list
  /// tile.
  ListTile _setTitle({
    required String icon,
    required String title,
    VoidCallback? onTap,
    Key? key,
  }) =>
      ListTile(
        key: key,
        // dense: true,
        horizontalTitleGap: 0,

        onTap: onTap,
        title: Text(title),
        leading: SvgPicture.asset(
          icon,
          color: AppColors.green,
          height: 18.0,
          width: 18.0,
        ),
      );
}
