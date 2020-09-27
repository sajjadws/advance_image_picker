import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:advanceimagepicker/global/common_views/button_text.dart';
import 'package:advanceimagepicker/global/common_views/common_text.dart';
import 'package:advanceimagepicker/global/common_views/h_spacer.dart';
import 'package:advanceimagepicker/global/common_views/title_text.dart';
import 'package:advanceimagepicker/global/common_views/v_spacer.dart';
import 'package:advanceimagepicker/global/constants/dims.dart';

import 'camera_page.dart';
import 'image_selector.dart';


class DialogChoosePickImage extends StatefulWidget {


  DialogChoosePickImage();

  @override
  State<StatefulWidget> createState() => DialogChoosePickImageState();
}

class DialogChoosePickImageState extends State<DialogChoosePickImage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;


  @override
  void initState() {
    super.initState();


    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 550));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: new Padding(
              padding: EdgeInsets.all(32),
              child: new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dims.commonBorderRadius),
                ),
                child: Padding(
                  padding: EdgeInsets.all(Dims.bigPadding),
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      dialogContent(),
                      VSpacer(
                        big: true,
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            child: ButtonText("بستن"),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget dialogContent() {
    return Column(
      children: <Widget>[

        TitleText("نحوه انتخاب عکس"),
        VSpacer(
          big: true,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: button("عکسبرداری", ()async {

                CameraDescription camera = await initializeCamera();
                String imagePath = await Navigator.push(context, MaterialPageRoute(builder: (context)=>TakePictureScreen(camera: camera,)));
                Navigator.pop(context,File(imagePath));


              }),
            ),
            HSpacer(),
            Expanded(
              child: ImageSelector(

                child: button("انتخاب از گالری", null),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget button(String text, VoidCallback onPressed) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Material(
        color: Theme.of(context).accentColor,
        borderRadius:
            BorderRadius.all(Radius.circular(Dims.commonBorderRadius)),
        elevation: 2,
        shadowColor: Colors.pink[200],
        child: InkWell(

          onTap: onPressed,
          child: Align(
            alignment: Alignment.center,
            child: CommonText(
              text,
            ),
          ),
        ),
      ),
    );
  }
  var cameras;
  var firstCamera;

}
