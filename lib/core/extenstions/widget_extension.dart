import 'package:flutter/cupertino.dart';

extension WidgetExtension on Widget {
  Widget visibility({bool visible = true}) => Visibility(
        visible: visible,
        child: this,
      );
}
