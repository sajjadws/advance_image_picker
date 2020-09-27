import 'package:flutter/material.dart';
import 'package:advanceimagepicker/global/constants/dims.dart';

class CommonText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color textColor;
  final bool bold;
  final bool singleLine;

  CommonText(this.text,
      {this.textAlign = TextAlign.center, this.textColor = Colors.black, this.bold = false, this.singleLine = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      textDirection: TextDirection.rtl,
      style: TextStyle(
          fontSize: Dims.commonFontSize(context),
          color: textColor,
          fontWeight: bold?FontWeight.bold:null
      ),
      textAlign: textAlign,
      maxLines: singleLine?1:null,
      overflow: singleLine?TextOverflow.ellipsis:null,
    );
  }
}
