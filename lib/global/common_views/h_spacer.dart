import 'package:flutter/material.dart';
import 'package:advanceimagepicker/global/constants/dims.dart';


class HSpacer extends StatelessWidget{

  final bool big;


  HSpacer({this.big = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: big?Dims.bigPadding:Dims.littlePadding,
    );
  }
}