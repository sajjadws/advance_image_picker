import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';

import 'dart:async';
import 'dart:io';



class DialogCropper extends StatefulWidget {

  CropController controller;
  Function afterCrop;
  double aspectRatio;
  DialogCropper({ this.controller,this.afterCrop, this.aspectRatio = 1/1});

  @override
  _DialogCropperState createState() => new _DialogCropperState();
}

class _DialogCropperState extends State<DialogCropper> {
  final cropKey = GlobalKey<CropState>();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    //openCropPage();

  }


  void openCropPage() async{

    final sample = await ImageCrop.sampleImage(
      file: widget.controller.inputFile,
      //preferredSize: context.size.longestSide.ceil(),
    );

  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
          child: _buildCroppingImage(),
        ),
      ),
    );
  }

  Widget _buildCroppingImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Crop.file(widget.controller.inputFile, key: cropKey,aspectRatio: widget.aspectRatio,),
        ),
        RaisedButton(
          color: Colors.white12,
          child: Text(
            'برش عکس',
            style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
          ),
          onPressed: () => _cropImage(),
        )
      ],
    );
  }

  Future<void> _cropImage() async {
    final permissionsGranted = await ImageCrop.requestPermissions();
    if (permissionsGranted){
      final scale = cropKey.currentState.scale;
    final area = cropKey.currentState.area;
    if (area == null) {
      // cannot crop, widget is not setup
      return;
    }

    // scale up to use maximum possible number of pixels
    // this will sample image in higher resolution to make cropped image larger
    final sample = await ImageCrop.sampleImage(
      file: widget.controller.inputFile,
      preferredSize: (2000 / scale).round(),
    );

    final file = await ImageCrop.cropImage(
      file: sample,
      area: area,
    );


     widget.controller.outputFile =  file;


     widget.afterCrop();
  }
  }


}


class CropController{

  File _inputFile,_outputFile;

  File get inputFile => _inputFile;

  set inputFile(File value) {
    _inputFile = value;
  }

  get outputFile => _outputFile;

  set outputFile(value) {
    _outputFile = value;
  }


}