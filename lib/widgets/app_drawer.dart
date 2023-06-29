import 'package:flutter/material.dart';
import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/core/constants/constants.dart';
import 'package:yaaseen/route/routes.dart';

/// It's a stateful widget that displays a drawer with a list of options

class AppDrawer extends StatelessWidget {
  final ValueChanged<String> onLanguageChanged;
  const AppDrawer({Key? key, required this.onLanguageChanged})
      : super(key: key);

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
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            DrawerListTile(
              key: AppKeys.readingMode,
              icon: AppIcons.alif,
              title: AppStrings.arabic_text.tr(),
              onTap: () {
                AppNavigator.pushNamed(RouteNames.reading);
              },
            ),
            DrawerListTile(
              icon: AppIcons.book,
              title: AppStrings.paged.tr(),
              onTap: () => AppNavigator.pushNamed(RouteNames.paged),
            ),
            // DrawerListTile(
            //   key: AppKeys.bookmarks,
            //   icon: AppIcons.bookmark_outlined,
            //   title: AppStrings.bookmarks.tr(),
            //   onTap: () {
            //     AppNavigator.pushNamed(RouteNames.bookmarks);
            //   },
            // ),
            DrawerListTile(
              key: AppKeys.settings,
              icon: AppIcons.settings,
              title: AppStrings.settings.tr(),
              onTap: () async {
                AppNavigator.pop();
                final result =
                    await AppNavigator.pushNamed(RouteNames.settings);
                if (result != null) {
                  onLanguageChanged.call(result.toString());
                }
              },
            ),
            DrawerListTile(
              key: AppKeys.rate,
              icon: AppIcons.rating_outlined,
              title: AppStrings.rate_app.tr(),
              onTap: () async {
                InAppReview inAppReview = InAppReview.instance;
                await inAppReview.openStoreListing();
              },
            ),
            DrawerListTile(
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
}

class DrawerListTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback? onTap;
  const DrawerListTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: key,
      // dense: true,
      horizontalTitleGap: 0,

      onTap: onTap,
      title: Text(title),
      leading: SvgPicture.asset(
        icon,
        height: 18.0,
        width: 18.0,
        colorFilter: const ColorFilter.mode(
          AppColors.green,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
