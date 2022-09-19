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

class MyUpgraderMessages extends UpgraderMessages {
  /// Override the message function to provide custom language localization.
  @override
  String message(UpgraderMessage messageKey) {
    switch (messageKey) {
      case UpgraderMessage.body:
        return 'es A new version of {{appName}} is available!';
      case UpgraderMessage.buttonTitleIgnore:
        return 'es Ignore';
      case UpgraderMessage.buttonTitleLater:
        return 'es Later';
      case UpgraderMessage.buttonTitleUpdate:
        return 'es Update Now';
      case UpgraderMessage.prompt:
        return 'es Want to update?';
      case UpgraderMessage.releaseNotes:
        return 'es Release Notes';
      case UpgraderMessage.title:
        return 'es Update App?';
    }
  }
}
