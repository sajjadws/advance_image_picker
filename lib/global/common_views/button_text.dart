import 'package:flutter/material.dart';
import 'package:advanceimagepicker/global/constants/dims.dart';


class ButtonText extends StatelessWidget{
  final String text;
  final TextAlign textAlign;
  Color textColor;
  ButtonText(this.text,{this.textAlign = TextAlign.center, this.textColor});



  @override
  Widget build(BuildContext context) {

    if(textColor == null)
      textColor = Theme.of(context).accentColor;

    // TODO: implement build
    return Text(text,style: TextStyle(
        fontSize: Dims.buttonFontSize(context),
        color: textColor,
        fontWeight: FontWeight.bold),textAlign: textAlign,);
  }



}


