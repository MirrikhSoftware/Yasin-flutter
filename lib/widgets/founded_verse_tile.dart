import 'package:flutter/material.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/models/verse/verse_model.dart';

class FoundedVerseTile extends StatelessWidget {
  final VerseModel verse;
  final String query;
  const FoundedVerseTile({
    super.key,
    required this.query,
    required this.verse,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: _highlightOccurrences(),
      ),
    );
  }

  List<TextSpan> _highlightOccurrences() {
    TextStyle simpleStyle = TextStyle();
    TextStyle highlightedStyle = TextStyle(fontWeight: FontWeight.w600);

    String source = verse.meaningUz.toString();

    if (!source.toLowerCase().contains(query.toLowerCase())) {
      return [
        TextSpan(text: source, style: simpleStyle),
      ];
    }
    final matches = query.toLowerCase().allMatches(source.toLowerCase());

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
          style: highlightedStyle,
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
