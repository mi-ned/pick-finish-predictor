import 'package:flutter/material.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_breakpoints.dart';

class AppStyle {
  final DisplayMode mode;

  AppStyle._(this.mode);

  factory AppStyle.of(BuildContext context) {
    return AppStyle._(AppBreakpoints.getMode(context));
  }

  bool get isCompact => mode == DisplayMode.iPhone;
  bool get isMedium => mode == DisplayMode.iPadPortrait;
  bool get isExpanded => mode == DisplayMode.macOS;

  //Top Left
  double get appLogoTitleFontSize => switch (mode) {
    DisplayMode.iPhone => 24.0,
    DisplayMode.iPadPortrait => 32.0,
    DisplayMode.macOS => 32.0,
    DisplayMode.iPadLandscape => 32.0,
  };

  double get modeIndicatorFontSize => switch (mode) {
    DisplayMode.iPhone => 14.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 16.0,
    DisplayMode.iPadLandscape => 16.0,
  };

  //Icon buttons
  double get iconButtonSize => switch (mode) {
    DisplayMode.iPhone => 24.0,
    DisplayMode.iPadPortrait => 32.0,
    DisplayMode.macOS => 32.0,
    DisplayMode.iPadLandscape => 32.0,
  };

  double get iconButtonHorizontalPadding => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 16.0,
    DisplayMode.iPadLandscape => 16.0,
  };

  double get iconButtonVerticalPadding => switch (mode) {
    DisplayMode.iPhone => 0.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 16.0,
    DisplayMode.iPadLandscape => 16.0,
  };

  double get iconButtonTouchTargetMultiplier => switch (mode) {
    DisplayMode.iPhone => 1.125,
    DisplayMode.iPadPortrait => 1.125,
    DisplayMode.macOS => 1.125,
    DisplayMode.iPadLandscape => 1.125,
  };

  double get iconButtonSpacing => switch (mode) {
    DisplayMode.iPhone => 8.0,
    DisplayMode.iPadPortrait => 8.0,
    DisplayMode.macOS => 8.0,
    DisplayMode.iPadLandscape => 8.0,
  };

  //Time Card
  double get timeCardTitleFontSize => switch (mode) {
    DisplayMode.iPhone => 14.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 16.0,
    DisplayMode.iPadLandscape => 16.0,
  };

  double get timeCardEstimateFontSize => switch (mode) {
    DisplayMode.iPhone => 64.0,
    DisplayMode.iPadPortrait => 80.0,
    DisplayMode.macOS => 80.0,
    DisplayMode.iPadLandscape => 80.0,
  };

  double get timeCardFooterFontSize => switch (mode) {
    DisplayMode.iPhone => 14.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 16.0,
    DisplayMode.iPadLandscape => 16.0,
  };

  double get timeCardHeightMultiplier => switch (mode) {
    DisplayMode.iPhone => 0.33,
    DisplayMode.iPadPortrait => 0.33,
    DisplayMode.macOS => 0.5,
    DisplayMode.iPadLandscape => 0.5,
  };

  double get timeCardBorderRadius => switch (mode) {
    DisplayMode.iPhone => 45.0,
    DisplayMode.iPadPortrait => 60.0,
    DisplayMode.macOS => 0.0,
    DisplayMode.iPadLandscape => 0.0,
  };

  double get timeCardSpacing => switch (mode) {
    DisplayMode.iPhone => 8.0,
    DisplayMode.iPadPortrait => 8.0,
    DisplayMode.macOS => 8.0,
    DisplayMode.iPadLandscape => 8.0,
  };

  //Text Field
  double get textFieldFontSize => switch (mode) {
    DisplayMode.iPhone => 14.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 14.0,
    DisplayMode.iPadLandscape => 14.0,
  };

  double get textFieldVerticalContentPadding => switch (mode) {
    DisplayMode.iPhone => 8.0,
    DisplayMode.iPadPortrait => 12.0,
    DisplayMode.macOS => 8.0,
    DisplayMode.iPadLandscape => 8.0,
  };

  double get textFieldHorizontalContentPadding => switch (mode) {
    DisplayMode.iPhone => 8.0,
    DisplayMode.iPadPortrait => 12.0,
    DisplayMode.macOS => 8.0,
    DisplayMode.iPadLandscape => 8.0,
  };

  //ENDE

  double get textFieldCloseIconMargin => switch (mode) {
    DisplayMode.iPhone => 12.0,
    DisplayMode.iPadPortrait => 12.0,
    DisplayMode.macOS => 12.0,
    DisplayMode.iPadLandscape => 12.0,
  };

  double get textFieldCloseIconWidth => switch (mode) {
    DisplayMode.iPhone => 40.0,
    DisplayMode.iPadPortrait => 48.0,
    DisplayMode.macOS => 40.0,
    DisplayMode.iPadLandscape => 40.0,
  };

  double get textFieldCloseIconHeight => switch (mode) {
    DisplayMode.iPhone => 32.0,
    DisplayMode.iPadPortrait => 40.0,
    DisplayMode.macOS => 32.0,
    DisplayMode.iPadLandscape => 40.0,
  };

  double get textFieldCloseIconSize => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 24.0,
    DisplayMode.macOS => 16.0,
    DisplayMode.iPadLandscape => 24.0,
  };

  double get textFieldErrorMessageFontSize => switch (mode) {
    DisplayMode.iPhone => 11.0,
    DisplayMode.iPadPortrait => 13.0,
    DisplayMode.macOS => 11.0,
    DisplayMode.iPadLandscape => 13.0,
  };

  double get textFieldErrorMessageSpacing => switch (mode) {
    DisplayMode.iPhone => 4.0,
    DisplayMode.iPadPortrait => 4.0,
    DisplayMode.macOS => 4.0,
    DisplayMode.iPadLandscape => 4.0,
  };

  //ENDE ZWEI

  double get textFieldHorizontalMargin => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 120.0,
    DisplayMode.macOS => 80.0,
    DisplayMode.iPadLandscape => 60.0,
  };

  double get textFieldVerticalMargin => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 60.0,
    DisplayMode.macOS => 10.0,
    DisplayMode.iPadLandscape => 10.0,
  };

  double get textFieldSpacing => switch (mode) {
    DisplayMode.iPhone => 30.0,
    DisplayMode.iPadPortrait => 60.0,
    DisplayMode.macOS => 50.0,
    DisplayMode.iPadLandscape => 50.0,
  };

  //ENDE DREI

  //Action Button

  double get actionButtonWidth => switch (mode) {
    DisplayMode.iPhone => 80.0,
    DisplayMode.iPadPortrait => 80.0,
    DisplayMode.macOS => 80.0,
    DisplayMode.iPadLandscape => 80.0,
  };

  double get actionButtonHeight => switch (mode) {
    DisplayMode.iPhone => 48.0,
    DisplayMode.iPadPortrait => 56.0,
    DisplayMode.macOS => 64.0,
    DisplayMode.iPadLandscape => 48.0,
  };

  double get actionButtonBorderRadius => switch (mode) {
    DisplayMode.iPhone => 24.0,
    DisplayMode.iPadPortrait => 28.0,
    DisplayMode.macOS => 32.0,
    DisplayMode.iPadLandscape => 24.0,
  };

  double get actionButtonHorizontalContentPadding => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 24.0,
    DisplayMode.macOS => 24.0,
    DisplayMode.iPadLandscape => 16.0,
  };

  double get actionButtonVerticalContentPadding => switch (mode) {
    DisplayMode.iPhone => 12.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 16.0,
    DisplayMode.iPadLandscape => 12.0,
  };

  double get actionButtonElevation => switch (mode) {
    DisplayMode.iPhone => 1.0,
    DisplayMode.iPadPortrait => 1.0,
    DisplayMode.macOS => 1.0,
    DisplayMode.iPadLandscape => 1.0,
  };

  double get actionButtonFontSize => switch (mode) {
    DisplayMode.iPhone => 20.0,
    DisplayMode.iPadPortrait => 24.0,
    DisplayMode.macOS => 24.0,
    DisplayMode.iPadLandscape => 24.0,
  };

  double get actionButtonHorizontalMargin => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 120.0,
    DisplayMode.macOS => 150.0,
    DisplayMode.iPadLandscape => 120.0,
  };

  double get actionButtonVerticalMargin => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 60.0,
    DisplayMode.macOS => 10.0,
    DisplayMode.iPadLandscape => 10.0,
  };

  double get actionButtonRowSpacing => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 60.0,
    DisplayMode.macOS => 60.0,
    DisplayMode.iPadLandscape => 60.0,
  };

  //History Card

  //Radii
  double get historyCardBorderRadius =>
      mode == DisplayMode.iPadLandscape ? 45.0 : 0.0;

  //Handle Pill
  double get historyCardHandlePillContentPadding =>
      mode == DisplayMode.iPadLandscape ? 20.0 : 0.0;

  double get historyCardHandlePillWidth =>
      mode == DisplayMode.iPadLandscape ? 30.0 : 0.0;

  double get historyCardHandlePillHeight =>
      mode == DisplayMode.iPadLandscape ? 5.0 : 0.0;

  double get historyCardHandlePillBorderRadius =>
      mode == DisplayMode.iPadLandscape ? 25.0 : 0.0;

  double get historyCardHandlePillSpacing =>
      mode == DisplayMode.iPadLandscape ? 8.0 : 0.0;

  //Font size

  double get historyCardTimelineFontSize => switch (mode) {
    DisplayMode.iPhone => 0.0,
    DisplayMode.iPadPortrait => 0.0,
    DisplayMode.macOS => 14.0,
    DisplayMode.iPadLandscape => 14.0,
  };

  double get historyCardTimeRecordedFontSize => switch (mode) {
    DisplayMode.iPhone => 0.0,
    DisplayMode.iPadPortrait => 0.0,
    DisplayMode.macOS => 12.0,
    DisplayMode.iPadLandscape => 12.0,
  };

  double get historyCardResultTimeFontSize => switch (mode) {
    DisplayMode.iPhone => 0.0,
    DisplayMode.iPadPortrait => 0.0,
    DisplayMode.macOS => 15.0,
    DisplayMode.iPadLandscape => 15.0,
  };

  //Margins
  double get historyCardHorizontalMargin => switch (mode) {
    DisplayMode.iPhone => 0.0,
    DisplayMode.iPadPortrait => 0.0,
    DisplayMode.macOS => 30.0,
    DisplayMode.iPadLandscape => 30.0,
  };

  double get historyCardVerticalMargin => switch (mode) {
    DisplayMode.iPhone => 0.0,
    DisplayMode.iPadPortrait => 0.0,
    DisplayMode.macOS => 24.0,
    DisplayMode.iPadLandscape => 24.0,
  };

  //Element spacing
  double get historyCardElementSpacing => switch (mode) {
    DisplayMode.iPhone => 0.0,
    DisplayMode.iPadPortrait => 0.0,
    DisplayMode.macOS => 8.0,
    DisplayMode.iPadLandscape => 8.0,
  };

  double get historyCardItemSpacing => switch (mode) {
    DisplayMode.iPhone => 0.0,
    DisplayMode.iPadPortrait => 0.0,
    DisplayMode.macOS => 24.0,
    DisplayMode.iPadLandscape => 30.0,
  };

  double get historyCardLastElementSpacing => switch (mode) {
    DisplayMode.iPhone => 0.0,
    DisplayMode.iPadPortrait => 0.0,
    DisplayMode.macOS => 12.0,
    DisplayMode.iPadLandscape => 12.0,
  };

  double get historyCardDividerHeight => switch (mode) {
    DisplayMode.iPhone => 0.0,
    DisplayMode.iPadPortrait => 0.0,
    DisplayMode.macOS => 1.0,
    DisplayMode.iPadLandscape => 1.0,
  };

  //Help
  //Container build
  double get helpContentSheetVerticalBorderRadius => switch (mode) {
    DisplayMode.iPhone => 45.0,
    DisplayMode.iPadPortrait => 60.0,
    DisplayMode.macOS => 0.0,
    DisplayMode.iPadLandscape => 0.0,
  };

  double get helpContentSheetHorizontalMargin => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 120.0,
    DisplayMode.macOS => 80.0,
    DisplayMode.iPadLandscape => 60.0,
  };

  double get helpContentSheetVerticalTopMargin => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 16.0,
    DisplayMode.iPadLandscape => 16.0,
  };

  double get helpContentSheetVerticalBottomMargin => switch (mode) {
    DisplayMode.iPhone => 8.0,
    DisplayMode.iPadPortrait => 8.0,
    DisplayMode.macOS => 8.0,
    DisplayMode.iPadLandscape => 8.0,
  };

  //Gaps
  double get helpContentSheetTitleSpacing => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 16.0,
    DisplayMode.iPadLandscape => 16.0,
  };

  double get helpContentSheetSearchBarSpacing => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 16.0,
    DisplayMode.iPadLandscape => 16.0,
  };

  double get helpContentSheetHandlePillSpacing => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 16.0,
    DisplayMode.iPadLandscape => 16.0,
  };

  //Header area
  double get helpContentSheetTitleFontSize => switch (mode) {
    DisplayMode.iPhone => 32.0,
    DisplayMode.iPadPortrait => 48.0,
    DisplayMode.macOS => 40.0,
    DisplayMode.iPadLandscape => 40.0,
  };

  //Search Bar
  double get helpContentSearchBarIconSize => switch (mode) {
    DisplayMode.iPhone => 20.0,
    DisplayMode.iPadPortrait => 24.0,
    DisplayMode.macOS => 20.0,
    DisplayMode.iPadLandscape => 20.0,
  };

  double get helpContentSheetSearchBarFontSize => switch (mode) {
    DisplayMode.iPhone => 14.0,
    DisplayMode.iPadPortrait => 15.0,
    DisplayMode.macOS => 14.0,
    DisplayMode.iPadLandscape => 14.0,
  };

  double get helpContentSheetSearchBarSuffixIconSize => switch (mode) {
    DisplayMode.iPhone => 20.0,
    DisplayMode.iPadPortrait => 20.0,
    DisplayMode.macOS => 20.0,
    DisplayMode.iPadLandscape => 20.0,
  };

  double get helpContentSheetSearchBarVerticalContentPadding => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 16.0,
    DisplayMode.iPadLandscape => 16.0,
  };

  double get helpContentSheetSearchBarBorderRadius => switch (mode) {
    DisplayMode.iPhone => 45.0,
    DisplayMode.iPadPortrait => 45.0,
    DisplayMode.macOS => 45.0,
    DisplayMode.iPadLandscape => 45.0,
  };

  double get helpContentSheetTileTitleFontSize => switch (mode) {
    DisplayMode.iPhone => 15.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 16.0,
    DisplayMode.iPadLandscape => 16.0,
  };

  double get helpContentSheetAccordianBodyVerticalMargin => switch (mode) {
    DisplayMode.iPhone => 24.0,
    DisplayMode.iPadPortrait => 24.0,
    DisplayMode.macOS => 24.0,
    DisplayMode.iPadLandscape => 24.0,
  };

  double get helpContentSheetAccordianBodyHorizontalMargin => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 16.0,
    DisplayMode.iPadLandscape => 16.0,
  };

  double get helpContentSheetAccordianBodyFontSize => switch (mode) {
    DisplayMode.iPhone => 13.0,
    DisplayMode.iPadPortrait => 14.0,
    DisplayMode.macOS => 14.0,
    DisplayMode.iPadLandscape => 14.0,
  };

  double get helpExpansionTileListContentsFontSize => switch (mode) {
    DisplayMode.iPhone => 12.0,
    DisplayMode.iPadPortrait => 13.0,
    DisplayMode.macOS => 13.0,
    DisplayMode.iPadLandscape => 13.0,
  };

  double get helpExpansionTileDividerHeight => switch (mode) {
    DisplayMode.iPhone => 1.0,
    DisplayMode.iPadPortrait => 1.0,
    DisplayMode.macOS => 1.0,
    DisplayMode.iPadLandscape => 1.0,
  };

  double get helpExpansionTileHorizontalMargin => switch (mode) {
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 60.0,
    DisplayMode.macOS => 10.0,
    DisplayMode.iPadLandscape => 10.0,
  };

  double get helpExpansionTileVerticalMargin => switch (mode) {
    DisplayMode.iPhone => 4.0,
    DisplayMode.iPadPortrait => 4.0,
    DisplayMode.macOS => 4.0,
    DisplayMode.iPadLandscape => 4.0,
  };

  double get helpContentSheetPillHandleWidth => switch (mode) {
    DisplayMode.iPhone => 48.0,
    DisplayMode.iPadPortrait => 48.0,
    DisplayMode.macOS => 48.0,
    DisplayMode.iPadLandscape => 48.0,
  };

  double get helpContentSheetPillHandleHeight => switch (mode) {
    DisplayMode.iPhone => 5.0,
    DisplayMode.iPadPortrait => 5.0,
    DisplayMode.macOS => 5.0,
    DisplayMode.iPadLandscape => 5.0,
  };
}
