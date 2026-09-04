import 'package:flutter/material.dart';

enum DisplayMode {
    iPhone,
    iPadPortrait,
    iPadLandscape,
    macOS,
}

class AppBreakpoints {
    static DisplayMode getMode(BuildContext context){
        final width = MediaQuery.of(context).size.width;
        final orientation = MediaQuery.of(context).orientation;        

        if (width >= 1200) {
          return DisplayMode.macOS;
        } else if(orientation == Orientation.landscape && width >= 700){
          return DisplayMode.iPadLandscape;
        } else if (width >= 600 || (orientation == Orientation.portrait && width >= 600)) {
          return DisplayMode.iPadPortrait;
        } else {
          return DisplayMode.iPhone;
        }
        
    }
}