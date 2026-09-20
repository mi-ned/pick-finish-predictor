import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pick_finish_predictor_ui/i18n/app_strings.dart';
import 'package:pick_finish_predictor_ui/theme/app_colours.dart';
import 'package:pick_finish_predictor_ui/views/layouts/app_style.dart';

class HeaderBranding extends StatelessWidget {

  final String modeName;
  final AppStrings strings;
  final AppStyle style;

  const HeaderBranding({
    super.key,
    required this.modeName,
    required this.strings,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppLogoTitle(strings: strings, style: style,),
        ModeIndicatorBadge(modeName: modeName, strings: strings, style: style,),
      ],
    );
  }
}

class AppLogoTitle extends StatelessWidget {

  final AppStrings strings;
  final AppStyle style;

  const AppLogoTitle({super.key, required this.strings, required this.style});

  @override
  Widget build(BuildContext context) {
    
    return Text(
      strings.appName,
      style: TextStyle(
        fontSize: style.appLogoTitleFontSize,
        fontFamily: 'Helvetica Neue',
        fontWeight: FontWeight.bold,
        color: AppColours.appLogoTitleForeground,
      ),
    );
  }
  
}

class ModeIndicatorBadge extends StatelessWidget {
  final String modeName;
  final AppStrings strings;
  final AppStyle style;

  const ModeIndicatorBadge({
    super.key,
  required this.modeName, required this.strings, required this.style});

  @override
  Widget build(BuildContext context){
    return Text(
      modeName,
      style: TextStyle(
        fontSize: style.modeIndicatorFontSize,
        fontFamily: 'Helvetica Neue',
        fontWeight: FontWeight.w500,
        color: AppColours.modeIndicatorBadgeForeground,
      ),
    );
  }
}