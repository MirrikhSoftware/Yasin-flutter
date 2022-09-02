import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/core/constants/constants.dart';
import 'package:yaaseen/route/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

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
                AppNavigator.pushNamed(RouteNames.settings);
              },
            ),
            _setTitle(
              icon: Icons.star,
              title: AppStrings.rate_app.tr(),
              onTap: () async {
                Uri url = Uri.parse('market://details?id=${AppStrings.app_id}');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
            ),
            _setTitle(
              icon: Icons.share,
              title: AppStrings.share_app.tr(),
              onTap: () async {
                Share.share(
                    '${AppStrings.download_app.tr()}\n${AppStrings.app_link}');
              },
            ),
            const Spacer(),
            ListTile(
              title: Text(AppStrings.version.tr()),
              trailing: const Text('1.5.3'),
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
