import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dialog_choose_pick_image.dart';
import 'dialog_cropper.dart';

class ImageSelector extends StatefulWidget {
  Widget child;

  Function(File image) onFileAdded;

  ImageSelector({
    this.child,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImageSelectorState();
  }
}

class ImageSelectorState extends State<ImageSelector> {
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
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    Navigator.pop(context, image);
  }
}
