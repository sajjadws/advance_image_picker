
import 'package:flutter/material.dart';

class Dims{

    static const double commonBorderRadius = 10.0;
    static const double boxBorderRadius = 20.0;

    static const double inputTextTitlePadding = 8.0;
    static const double littlePadding = 8.0;
    static const double bigPadding = 16.0;

    static const double refreshDistanceMeter = 1000.0;

    static const buttonPadding = EdgeInsets.only(top: 12,bottom: 12);


    static Size displaySize(BuildContext context) {
        debugPrint('Size = ' + MediaQuery.of(context).size.toString());
        return MediaQuery.of(context).size;
    }

    double displayHeight(BuildContext context) {
        debugPrint('Height = ' + displaySize(context).height.toString());
        return displaySize(context).height;
    }

    static double buttonFontSize(BuildContext context) {
        return displaySize(context).width * 0.035;
    }
    static double commonFontSize(BuildContext context) {
        return displaySize(context).width * 0.033;
    }
    static double titleFontSize(BuildContext context) {
        return displaySize(context).width * 0.045;
    }
}