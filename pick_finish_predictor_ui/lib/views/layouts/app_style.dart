import 'package:flutter/material.dart';

enum DisplayMode {
  compact, medium, expanded,
}

class AppStyle {
  final DisplayMode mode;

  AppStyle._(this.mode);

  factory AppStyle.of(BuildContext context){
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final orientation = MediaQuery.of(context).orientation;

    DisplayMode mode;

    if (width >= 900 || (orientation == Orientation.landscape && width >= 700)) {
      mode = DisplayMode.expanded;
    } else if (width >= 600) {
      mode = DisplayMode.medium;
    } else {
      mode = DisplayMode.compact;
    }

    return AppStyle._(mode);
  }

  bool get isCompact => mode == DisplayMode.compact;
  bool get isMedium => mode == DisplayMode.medium;
  bool get isExpanded => mode == DisplayMode.expanded;

  double get headerIconSize => switch (mode){
    DisplayMode.compact => 24.0,
    DisplayMode.medium => 32.0,
    DisplayMode.expanded => 32.0,
  };

  double get messagesCompletionTimeCard => switch (mode){
    DisplayMode.compact => 14.0,
    DisplayMode.medium => 16.0,
    DisplayMode.expanded => 16.0,
  };

   double get timeCompletionTimeCard => switch (mode){
    DisplayMode.compact => 64.0,
    DisplayMode.medium => 80.0,
    DisplayMode.expanded => 80.0,
  };

  double get textFieldFont => switch (mode){
    DisplayMode.compact => 14.0,
    DisplayMode.medium => 16.0,
    DisplayMode.expanded => 16.0,
  };

  double get textFieldVerticalPadding => switch(mode){
    DisplayMode.compact => 8.0,
    DisplayMode.medium => 12.0,
    DisplayMode.expanded => 12.0,
  };

  double get textFieldSuffixWidth => switch(mode){
    DisplayMode.compact => 40.0,
    DisplayMode.medium => 48.0,
    DisplayMode.expanded => 48.0,
  };

  double get textFieldSuffixHeight => switch(mode){
    DisplayMode.compact => 32.0,
    DisplayMode.medium => 40.0,
    DisplayMode.expanded => 40.0,
  };

  double get textFieldCloseIcon => switch(mode){
    DisplayMode.compact => 16.0,
    DisplayMode.medium => 24.0,
    DisplayMode.expanded => 24.0,
  };

  double get textFieldErrorMessage => switch(mode){
    DisplayMode.compact => 11.0,
    DisplayMode.medium => 13.0,
    DisplayMode.expanded => 13.0,
  };

  double get actionButtonHeight => switch(mode){
    DisplayMode.compact => 48.0,
    DisplayMode.medium => 56.0,
    DisplayMode.expanded => 56.0,
  };

  double get actionButtonHorizontalPadding => switch(mode){
    DisplayMode.compact => 16.0,
    DisplayMode.medium => 24.0,
    DisplayMode.expanded => 24.0,
  };

  double get actionButtonVerticalPadding => switch(mode){
    DisplayMode.compact => 12.0,
    DisplayMode.medium => 16.0,
    DisplayMode.expanded => 16.0,
  };

  double get actionButtonFontSize => switch(mode){
    DisplayMode.compact => 20.0,
    DisplayMode.medium => 24.0,
    DisplayMode.expanded => 24.0,
  };

  double get headerHorizontalPadding => switch (mode) {
  DisplayMode.compact => 16.0,
  DisplayMode.medium => 16.0,
  DisplayMode.expanded => 16.0,
};

double get headerVerticalPadding => switch (mode) {
  DisplayMode.compact => 0.0,
  DisplayMode.medium => 16.0,
  DisplayMode.expanded => 16.0,
};

double get headerHeightMultiplier => switch (mode) {
  DisplayMode.compact => 0.33,  // 33% of screen height
  DisplayMode.medium => 0.33,   // 30% of screen height
  DisplayMode.expanded => 0.33,
};

// --- Form & Middle Section ---
double get bodyHorizontalPadding => switch (mode) {
  DisplayMode.compact => 16.0,
  DisplayMode.medium => 120.0,
  DisplayMode.expanded => 64.0,
};

double get bodyVerticalPadding => switch (mode) {
  DisplayMode.compact => 16.0,
  DisplayMode.medium => 60.0,
  DisplayMode.expanded => 32.0,
};

double get inputFieldSpacing => switch (mode) {
  DisplayMode.compact => 30.0,
  DisplayMode.medium => 60.0,
  DisplayMode.expanded => 24.0,
};

// --- Bottom Action Buttons ---
double get bottomBarPadding => switch (mode) {
  DisplayMode.compact => 16.0,
  DisplayMode.medium => 60.0,
  DisplayMode.expanded => 32.0,
};

double get actionButtonGap => switch (mode) {
  DisplayMode.compact => 16.0,
  DisplayMode.medium => 60.0,
  DisplayMode.expanded => 20.0,
};

double get radiusCompletionTimeCard => switch(mode) {
  DisplayMode.compact => 45.0,
  DisplayMode.medium => 60.0,
  DisplayMode.expanded => 60.0,
};

  
}