import 'package:flutter/material.dart';
import 'package:yaaseen/core/components/components.dart';

class UpgradingScreen extends StatelessWidget {
  final Widget child;
  const UpgradingScreen({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      child: child,
      upgrader: Upgrader(
        // messages: MyUpgraderMessages(),
      ),
    );
  }
}

// class MyUpgraderMessages extends UpgraderMessages {
//   @override
//   String? message(UpgraderMessage messageKey) {
//     switch (messageKey) {
//       case UpgraderMessage.body:
//         return LocaleKeys.new_version.tr(args: ['']);
//       case UpgraderMessage.buttonTitleIgnore:
//         return LocaleKeys.cancel.tr();
//       case UpgraderMessage.buttonTitleLater:
//         return LocaleKeys.later.tr();
//       case UpgraderMessage.buttonTitleUpdate:
//         return LocaleKeys.update.tr();
//       case UpgraderMessage.prompt:
//         return LocaleKeys.want_to_update.tr();
//       case UpgraderMessage.releaseNotes:
//         return LocaleKeys.release_notes.tr();
//       case UpgraderMessage.title:
//         return LocaleKeys.update_app.tr();
//     }
//   }
// }