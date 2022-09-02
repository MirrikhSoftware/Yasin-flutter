import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/core/constants/app_colors.dart';
import 'package:yaaseen/core/constants/app_strings.dart';
import 'package:yaaseen/route/app_navigator.dart';
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
              onTap: () {},
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
