import 'dart:io';


import 'package:flutter/material.dart';
import 'package:advanceimagepicker/global/overly_alert.dart';
import 'package:image_picker/image_picker.dart';

import 'dialog_choose_pick_image.dart';
import 'dialog_cropper.dart';

class ImageSelectorResult extends StatefulWidget {
  Widget child;

  double aspectRatio;

  bool useCropper;
  final bool useSelectFrom;

  Function(File image) onFileAdded;

  ImageSelectorResult(
      {this.onFileAdded,
        this.child,
        this.aspectRatio = 1 / 1,
        this.useCropper = true,
        this.useSelectFrom = false,
      });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImageSelectorResultState();
  }
}

class ImageSelectorResultState extends State<ImageSelectorResult> {
  CropController _cropController = CropController();

  File _image;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: widget.child,
      onTap: getImage,
    );
  }

  //////////////////////////////////// widgets //////////////////////////

  Future getImage() async {

    File imageFile = await showDialog(context: context,builder: (context)=>DialogChoosePickImage());


    if(widget.useCropper){
      _cropController.inputFile = imageFile;
      showDialog(
          context: context,
          builder: (BuildContext context) => DialogCropper(
            aspectRatio: widget.aspectRatio,
            controller: _cropController,
            afterCrop: () {
              Navigator.pop(context);

              setState(() {
                _image = _cropController.outputFile;
                if ((_image.lengthSync() / 1024) / 1024 < 3) {
                  widget.onFileAdded(_image);
                } else {
                  OverlyAlert.show(
                      "حجم فایل بیشتر از مقدار تعیین شده است", context,
                      duration: OverlyAlert.LENGTH_LONG,
                      gravity: OverlyAlert.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white);
                }
              });
            },
          ));
    }else{
      widget.onFileAdded(imageFile);
    }








  }
}
