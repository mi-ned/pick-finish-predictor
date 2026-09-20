import 'package:flutter/material.dart';

class SearchBarHighlightedText extends StatelessWidget {
  final String text;
  final String searchQuery;
  final TextStyle textStyle;
  final Color highlightBackgroundColor;
  final Color highlightForegroundColor;

  const SearchBarHighlightedText({
    super.key,
    required this.text,
    required this.searchQuery,
    required this.textStyle,
    required this.highlightBackgroundColor,
    required this.highlightForegroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final cleanQuery = searchQuery.trim().toLowerCase();
    if (cleanQuery.isEmpty) {
      return Text(text, style: textStyle);
    }

    final List<TextSpan> spans = [];
    final String searchableText = text.toLowerCase();

    int startIndex = 0;
    int matchIndex = searchableText.indexOf(cleanQuery, startIndex);

    while (matchIndex != -1) {
      if (matchIndex > startIndex) {
        spans.add(TextSpan(text: text.substring(startIndex, matchIndex)));
      }

      final matchText = text.substring(
        matchIndex,
        matchIndex + cleanQuery.length,
      );
      spans.add(
        TextSpan(
          text: matchText,
          style: textStyle.copyWith(
            backgroundColor: highlightBackgroundColor,
            color: highlightForegroundColor,
          ),
        ),
      );

      startIndex = matchIndex + cleanQuery.length;
      matchIndex = searchableText.indexOf(cleanQuery, startIndex);
    }

    if (startIndex < text.length) {
      spans.add(TextSpan(text: text.substring(startIndex)));
    }

    return Text.rich(TextSpan(style: textStyle, children: spans));
  }
}