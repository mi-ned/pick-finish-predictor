
import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppColours {
  //Main colours
  static const Color primaryBackground = Color(0xFF252525);
  static const Color secondaryBackgroundLight = Color(0xFF00897b);
  static const Color secondaryBackgroundDark = Color(0xFF263238);

  //Top Left
  static const Color appLogoTitleForeground = Color(0xFFFFFFFF);
  static const Color modeIndicatorBadgeForeground = Color(0xFFE0E0E0);
  //TextField
  //Background
  static const Color textFieldBackgroundEnabled = Color(0xFF191919);
  static const Color textFieldBackgroundPressed = Color(0xFF2a2a2a);
  static const Color textFieldBackgroundDisabled = Color(0xFF1f1f1f);
  //States
  static const Color textFieldBackgroundErrorState = Color(0xFF240000);
  static const Color textFieldBackgroundValidState = Color(0xFF002400);
  //Foreground
  static const Color textFieldForegroundHint = Color(0xFFa4a4a4);
  static const Color textFieldForegroundNormal = Color(0xFFf0f0f0);
  static const Color textFieldForegroundInvalid = Color(0xFFae0000);
  static const Color textFieldForegroundDisabled = Color(0xFF555555);

  //Clear Button
  //Background
  static const Color clearButtonBackgroundDisabled = Color(0xff0d2a2a);
  static const Color clearButtonBackgroundEnabled = Color(0xff005e4e);
  static const Color clearButtonBackgroundPressed = Color(0xff004338);
  //Foreground
  static const Color clearButtonForegroundDisabled = Color(0xff2e6b6b);
  static const Color clearButtonForegroundEnabled = Color(0xffa0f0e0);
  static const Color clearButtonForegroundPressed = Color(0xffcffff5);

  //Calculate Button
  //Background
  static const Color calculateButtonBackgroundDisabled = Color(0xff3a2818);
  static const Color calculateButtonBackgroundEnabled = Color(0xffcc6600);
  static const Color calculateButtonBackgroundPressed = Color(0xff994d00);
  //Foreground
  static const Color calculateButtonForegroundDisabled = Color(0xff8a6038);
  static const Color calculateButtonForegroundEnabled = Color(0xffffffff);
  static const Color calculateButtonForegroundPressed = Color(0xffe0e0e0);

  //Close Button
  //Background
  static const Color closeButtonBackgroundEnabledDisabled = Color(0x00000000);
  static const Color closeButtonBackgroundPressed = Color(0xffae0000);
  //Foreground
  static const Color closeButtonForegroundEnabled = Color(0xffffffff);
  static const Color closeButtonForegroundDisabled = Color(0xffa0a0a0);
  static const Color closeButtonForegroundPressed = Color(0xffe0e0e0);

  //History Tile
  //Background
  static const Color historyCardPrimaryBackground = Color(0xff323232);
  static const Color historyCardSliderBackground = Color(0xff888888);
  static const Color historyCardDividerBackground = Color(0xff888888);

  //Foreground
  static const Color historyCardPrimaryForeground = Color(0xfff0f0f0);
  static const Color historyCardSecondaryForeground = Color(0xffa4a4a4);

  //Help
  //Background
  static const Color helpExpansionTileOpenBackground = Color(0xff323232);

  //Trailing Icon
  static const Color helpExpansionTileTrailingIconBackgroundNormal = Color(0xffcc6600);
  static const Color helpExpansionTileTrailingIconBackgroundCollapsed = Color(0xffa0f0e0);

  //Divider
  static const Color helpExpansionTileDividerBackground = Colors.white12;

  //Searchbar
  static const Color helpExpansionTileSearchBarBackground = Color.fromARGB(125, 25, 25, 25);
  
  //Highlighted
  static const Color helpExpansionTileSearchBarHighlightedBackground = Color(0xffa0f0e0);

  //Foreground
  static const Color helpExpansiontilePrimaryForeground = Color(0xffffffff);
  static const Color helpExpansionTileOpenForeground = Color(0xfff0f0f0);

  //Searchbar
  static const Color helpExpansionTileSearchBarForegroundMain = Color(0xffffffff);
  static const Color helpExpansionTileSearchBarForegroundHint = Color(0xff888888);

  //Highlighted
  static const Color helpExpansionTileSearchBarHighlightedForeground = Color(0xff005e4e);

  //Pill Handle
  static const Color helpExpansionPillHandle = Color(0xff888888);
  
}