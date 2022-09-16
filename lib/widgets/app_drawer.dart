import 'package:flutter/material.dart';
import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/core/constants/constants.dart';
import 'package:yaaseen/route/routes.dart';

/// It's a stateful widget that displays a drawer with a list of options

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                AppIcons.app_icon,
                height: 64.h,
                width: 64.h,
              ),
            ),
            Text(
              AppStrings.app_name.tr(),
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            _setTitle(
              icon: AppIcons.alif,
              title: AppStrings.arabic_text.tr(),
              onTap: () {
                AppNavigator.pushNamed(RouteNames.reading);
              },
            ),
            _setTitle(
              icon: AppIcons.bookmark_outlined,
              title: AppStrings.bookmarks.tr(),
              onTap: () {
                AppNavigator.pushNamed(RouteNames.bookmarks);
              },
            ),
            _setTitle(
              icon: AppIcons.settings,
              title: AppStrings.settings.tr(),
              onTap: () {
                AppNavigator.pushNamed(RouteNames.settings).then(
                  (value) => setState(() {}),
                );
              },
            ),
            _setTitle(
              icon: AppIcons.rating,
              title: AppStrings.rate_app.tr(),
              onTap: () async {
                InAppReview inAppReview = InAppReview.instance;
                await inAppReview.openStoreListing();
              },
            ),
            _setTitle(
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
              trailing: const Text('2.0.1'),
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
  }) =>
      ListTile(
        leading: SvgPicture.asset(icon, color: AppColors.green),
        title: Align(alignment: const Alignment(-1.2, 0), child: Text(title)),
        onTap: onTap,
      );
}
