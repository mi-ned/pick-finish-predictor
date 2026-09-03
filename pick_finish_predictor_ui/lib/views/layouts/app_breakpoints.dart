import 'package:flutter/material.dart';

enum DisplayMode {
    compact,
    medium,
    expanded,
}

class AppBreakpoints {
    static DisplayMode getMode(BuildContext context){
        final width = MediaQuery.of(context).size.width;
        final orientation = MediaQuery.of(context).orientation;

        if(width >= 900 || orientation == Orientation.landscape && width >= 700){
            return DisplayMode.expanded;
        } else if(width >= 600){
            return DisplayMode.medium;
        } else {
            return DisplayMode.compact;
        }
    }
}