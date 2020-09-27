import 'package:flutter/material.dart';
import 'package:advanceimagepicker/global/constants/dims.dart';

class TitleText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color textColor;
  final bool bold;
  final bool singleLine;
  TitleText(this.text,
      {this.textAlign = TextAlign.center,
        this.textColor = Colors.black,
        this.bold = false,
        this.singleLine = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      textDirection: TextDirection.rtl,
      maxLines: singleLine?1:null,
      overflow: singleLine?TextOverflow.ellipsis:null,
      style: TextStyle(
          color: textColor,
          fontWeight: bold ? FontWeight.bold : null,
          fontSize: Dims.titleFontSize(context)),
      textAlign: textAlign,
    );
  }
}
