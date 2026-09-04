import 'package:flutter/material.dart';

enum DisplayMode {
  iPhone, iPadPortrait, iPadLandscape, macOS,

}

class AppStyle {
  final DisplayMode mode;

  AppStyle._(this.mode);

  factory AppStyle.of(BuildContext context){
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    DisplayMode mode;

    if (width >= 1200) {
      mode = DisplayMode.macOS;
    } else if(orientation == Orientation.landscape && width >= 700){
      mode = DisplayMode.iPadLandscape;
    } else if (width >= 600 || (orientation == Orientation.portrait && width >= 600)) {
      mode = DisplayMode.iPadPortrait;
    } else {
      mode = DisplayMode.iPhone;
    }

    return AppStyle._(mode);
  }

  bool get isCompact => mode == DisplayMode.iPhone;
  bool get isMedium => mode == DisplayMode.iPadPortrait;
  bool get isExpanded => mode == DisplayMode.macOS;

  double get headerIconSize => switch (mode){
    DisplayMode.iPhone => 24.0,
    DisplayMode.iPadPortrait => 32.0,
    DisplayMode.macOS => 32.0,
    DisplayMode.iPadLandscape => 32.0,
  };

  double get messagesCompletionTimeCard => switch (mode){
    DisplayMode.iPhone => 14.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 16.0,
    // TODO: Handle this case.
    DisplayMode.iPadLandscape => 16.0,
  };

   double get timeCompletionTimeCard => switch (mode){
    DisplayMode.iPhone => 64.0,
    DisplayMode.iPadPortrait => 80.0,
    DisplayMode.macOS => 80.0,
     // TODO: Handle this case.
     DisplayMode.iPadLandscape => 80.0,
  };

  double get textFieldFont => switch (mode){
    DisplayMode.iPhone => 14.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 14.0,
    // TODO: Handle this case.
    DisplayMode.iPadLandscape => 14.0,
  };

  double get textFieldVerticalPadding => switch(mode){
    DisplayMode.iPhone => 8.0,
    DisplayMode.iPadPortrait => 12.0,
    DisplayMode.macOS => 8.0,
    // TODO: Handle this case.
    DisplayMode.iPadLandscape => 8.0,
  };

  double get textFieldSuffixWidth => switch(mode){
    DisplayMode.iPhone => 40.0,
    DisplayMode.iPadPortrait => 48.0,
    DisplayMode.macOS => 40.0,
    // TODO: Handle this case.
    DisplayMode.iPadLandscape => 40.0,
  };

  double get textFieldSuffixHeight => switch(mode){
    DisplayMode.iPhone => 32.0,
    DisplayMode.iPadPortrait => 40.0,
    DisplayMode.macOS => 32.0,
    // TODO: Handle this case.
    DisplayMode.iPadLandscape => 32.0,
  };

  double get textFieldCloseIcon => switch(mode){
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 24.0,
    DisplayMode.macOS => 16.0,
    // TODO: Handle this case.
    DisplayMode.iPadLandscape => 16.0,
  };

  double get textFieldErrorMessage => switch(mode){
    DisplayMode.iPhone => 11.0,
    DisplayMode.iPadPortrait => 13.0,
    DisplayMode.macOS => 11.0,
    // TODO: Handle this case.
    DisplayMode.iPadLandscape => 11.0,
  };

  double get actionButtonHeight => switch(mode){
    DisplayMode.iPhone => 48.0,
    DisplayMode.iPadPortrait => 56.0,
    DisplayMode.macOS => 56.0,
    // TODO: Handle this case.
    DisplayMode.iPadLandscape => 56.0,
  };

  double get actionButtonHorizontalPadding => switch(mode){
    DisplayMode.iPhone => 16.0,
    DisplayMode.iPadPortrait => 24.0,
    DisplayMode.macOS => 24.0,
    // TODO: Handle this case.
    DisplayMode.iPadLandscape => 24.0,
  };

  double get actionButtonVerticalPadding => switch(mode){
    DisplayMode.iPhone => 12.0,
    DisplayMode.iPadPortrait => 16.0,
    DisplayMode.macOS => 16.0,
    // TODO: Handle this case.
    DisplayMode.iPadLandscape => 16.0,
  };

  double get actionButtonFontSize => switch(mode){
    DisplayMode.iPhone => 20.0,
    DisplayMode.iPadPortrait => 24.0,
    DisplayMode.macOS => 24.0,
    // TODO: Handle this case.
    DisplayMode.iPadLandscape => 24.0,
  };

  double get headerHorizontalPadding => switch (mode) {
  DisplayMode.iPhone => 16.0,
  DisplayMode.iPadPortrait => 16.0,
  DisplayMode.macOS => 16.0,
    // TODO: Handle this case.
    DisplayMode.iPadLandscape => 16.0,
};

double get headerVerticalPadding => switch (mode) {
  DisplayMode.iPhone => 0.0,
  DisplayMode.iPadPortrait => 16.0,
  DisplayMode.macOS => 16.0,
  // TODO: Handle this case.
  DisplayMode.iPadLandscape => 16.0,
};

double get headerHeightMultiplier => switch (mode) {
  DisplayMode.iPhone => 0.33,  // 33% of screen height
  DisplayMode.iPadPortrait => 0.33,   // 30% of screen height
  DisplayMode.macOS => 0.5,
  // TODO: Handle this case.
  DisplayMode.iPadLandscape => 0.5,
};

// --- Form & Middle Section ---
double get bodyHorizontalPadding => switch (mode) {
  DisplayMode.iPhone => 16.0,
  DisplayMode.iPadPortrait => 120.0,
  DisplayMode.macOS => 80.0,
  // TODO: Handle this case.
  DisplayMode.iPadLandscape => 80.0,
};

double get bodyVerticalPadding => switch (mode) {
  DisplayMode.iPhone => 16.0,
  DisplayMode.iPadPortrait => 60.0,
  DisplayMode.macOS => 10.0,
  // TODO: Handle this case.
  DisplayMode.iPadLandscape => 10.0,
};

double get inputFieldSpacing => switch (mode) {
  DisplayMode.iPhone => 30.0,
  DisplayMode.iPadPortrait => 60.0,
  DisplayMode.macOS => 50.0,
  // TODO: Handle this case.
  DisplayMode.iPadLandscape => 50.0,
};

// --- Bottom Action Buttons ---
double get bottomBarPadding => switch (mode) {
  DisplayMode.iPhone => 16.0,
  DisplayMode.iPadPortrait => 60.0,
  DisplayMode.macOS => 0.0,
  // TODO: Handle this case.
  DisplayMode.iPadLandscape => 0.0,
};

double get actionButtonGap => switch (mode) {
  DisplayMode.iPhone => 16.0,
  DisplayMode.iPadPortrait => 60.0,
  DisplayMode.macOS => 60.0,
  // TODO: Handle this case.
  DisplayMode.iPadLandscape => 0.0,
};

double get radiusCompletionTimeCard => switch(mode) {
  DisplayMode.iPhone => 45.0,
  DisplayMode.iPadPortrait => 60.0,
  DisplayMode.macOS => 0.0,
  // TODO: Handle this case.
  DisplayMode.iPadLandscape => 0.0,
};

//History tab

//double get handlePillPaddingHistoryCard 20.0

//double get handlePillWidthHistoryCard 30.0

//double get handlePillHeightHistoryCard 5.0

//double get handlePillRadiusHistoryCard 25.0

//double get handlePillSpacingHistoryCard 8.0

double get timelineFontSizeHistoryCard => switch(mode){
  DisplayMode.iPhone => 0.0,
  DisplayMode.iPadPortrait => 0.0,
  DisplayMode.macOS => 12.0,
  // TODO: Handle this case.
  DisplayMode.iPadLandscape => 12.0,
};

double get timeRecordedFontSizeHistoryCard => switch(mode){
  DisplayMode.iPhone => 0.0,
  DisplayMode.iPadPortrait => 0.0,
  DisplayMode.macOS => 9.0,
  // TODO: Handle this case.
  DisplayMode.iPadLandscape => 9.0,
};

double get resultTimeFontSizeHistoryCard => switch(mode){
  DisplayMode.iPhone => 0.0,
  DisplayMode.iPadPortrait => 0.0,
  DisplayMode.macOS => 13.0,
  // TODO: Handle this case.
  DisplayMode.iPadLandscape => 13.0,
};

  
}