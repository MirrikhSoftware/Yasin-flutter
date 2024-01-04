/*

  Created by: Bakhromjon Polat
  Created on: May 21 2023 12:00:26
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

// RegExp('\\(.*?\\)')
import 'package:flutter/material.dart';

class HighlightText extends StatelessWidget {
  final String source;
  final String target;
  final RegExp? pattern;
  final TextStyle? highlightStyle;
  final TextStyle? simpleStyle;

  const HighlightText({
    super.key,
    required this.source,
    required this.target,
    this.highlightStyle,
    this.simpleStyle,
    this.pattern,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: _highlightOccurrences()),
      // textAlign: TextAlign.justify,
    );
  }

  List<TextSpan> _highlightOccurrences() {
    Iterable<Match> matches = const Iterable.empty();

    if (pattern == null) {
      if (!source.toLowerCase().contains(target.toLowerCase())) {
        return [TextSpan(text: source, style: simpleStyle)];
      }
      matches = target.toLowerCase().allMatches(source.toLowerCase());
    } else {
      matches = pattern?.allMatches(source) ?? const Iterable.empty();
    }

    if (matches.isEmpty) {
      return [TextSpan(text: source, style: simpleStyle)];
    }

    int lastMatchEnd = 0;

    final List<TextSpan> children = [];
    for (var i = 0; i < matches.length; i++) {
      final match = matches.elementAt(i);

      if (match.start != lastMatchEnd) {
        children.add(
          TextSpan(
            text: source.substring(lastMatchEnd, match.start),
            style: simpleStyle,
          ),
        );
      }

      children.add(
        TextSpan(
          text: source.substring(match.start, match.end),
          style: highlightStyle,
        ),
      );

      if (i == matches.length - 1 && match.end != source.length) {
        children.add(
          TextSpan(
            text: source.substring(match.end, source.length),
            style: simpleStyle,
          ),
        );
      }

      lastMatchEnd = match.end;
    }
    return children;
  }
}
