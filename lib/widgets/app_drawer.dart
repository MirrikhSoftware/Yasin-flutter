import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/core/constants/constants.dart';
import 'package:yaaseen/route/routes.dart';

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
              icon: Icons.chrome_reader_mode_outlined,
              title: AppStrings.arabic_text.tr(),
              onTap: () {
                AppNavigator.pushNamed(RouteNames.reading);
              },
            ),
            _setTitle(
              icon: Icons.bookmark,
              title: AppStrings.bookmarks.tr(),
              onTap: () {
                AppNavigator.pushNamed(RouteNames.bookmarks);
              },
            ),
            _setTitle(
              icon: Icons.settings,
              title: AppStrings.settings.tr(),
              onTap: () {
                AppNavigator.pushNamed(RouteNames.settings).then(
                  (value) => setState(() {}),
                );
              },
            ),
            _setTitle(
              icon: Icons.star,
              title: AppStrings.rate_app.tr(),
              onTap: () async {
                InAppReview inAppReview = InAppReview.instance;
                await inAppReview.openStoreListing();
              },
            ),
            _setTitle(
              icon: Icons.share,
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

  ListTile _setTitle({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) =>
      ListTile(
        leading: Icon(icon, color: AppColors.green),
        title: Text(title),
        onTap: onTap,
      );
}
